import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:playground/widget/simulation_graph.dart';

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
  late final endPoint = widget.height / 2;

  @override
  void initState() {
    super.initState();

    _simulation = SpringSimulation(
      const SpringDescription(mass: 0.5, stiffness: 3, damping: 0.8),
      0,
      endPoint,
      100,
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
                maxValue: endPoint,
              ),
            ),
          ),
        ],
      );
}
