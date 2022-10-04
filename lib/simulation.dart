import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(
      MaterialApp(
        home: LayoutBuilder(
          builder: (context, constraints) => Scaffold(
            backgroundColor: Colors.black,
            body: MyApp(
              height: constraints.maxHeight,
            ),
          ),
        ),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.height});
  final double height;

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Simulation _simulation;

  @override
  void initState() {
    super.initState();

    _simulation = SpringSimulation(
      const SpringDescription(mass: 0.1, stiffness: 4, damping: 1),
      widget.height / 2,
      widget.height / 4,
      20,
    );

    _controller = AnimationController(vsync: this, upperBound: widget.height);
    _controller.animateWith(_simulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => SizedBox(
              width: double.infinity,
              height: _controller.value,
              child: Container(color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 400,
              height: 150,
              child: SimulationGraph(
                simulation: _simulation,
                maxValue: widget.height,
              ),
            ),
          ),
        ],
      );
}

class SimulationGraph extends StatelessWidget {
  final Simulation simulation;
  final double maxValue;

  const SimulationGraph({
    super.key,
    required this.simulation,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: SimulationPainter(simulation, maxValue),
      );
}

class SimulationPainter extends CustomPainter {
  final Simulation simulation;
  late final double _yDivisionFactor;

  final Paint _backgroundPaint = Paint()..color = Colors.grey;
  final Paint _xAxisPaint = Paint()..color = Colors.red;
  final Paint _pathPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  SimulationPainter(this.simulation, double maxValue) {
    _yDivisionFactor = 100 / maxValue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _backgroundPaint,
    );
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      _xAxisPaint,
    );

    final path = Path();
    path.moveTo(0, 0);

    double t = 0.0;
    for (int x = 0; x < size.width; x++, t += 0.1) {
      final dt = t.toDouble();
      final y = simulation.x(dt) * _yDivisionFactor;

      path.lineTo(x.toDouble(), y);
    }

    canvas.drawPath(path, _pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO optimize
    return true;
  }
}
