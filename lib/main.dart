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
  late final AnimationController controller;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    final endDistance = widget.height;
    final acceleration = widget.height / 2;
    const distance = 0.0;
    const initialVelocity = 0.0;

    final gravitySimulation = GravitySimulation(
      acceleration,
      distance,
      endDistance,
      initialVelocity,
    );

    controller = AnimationController(vsync: this, upperBound: endDistance);
    controller.animateWith(gravitySimulation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return SizedBox(
          width: double.infinity,
          height: controller.value,
          child: Container(color: Colors.green),
        );
      });
}
