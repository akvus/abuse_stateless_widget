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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, upperBound: widget.height);
    _controller.animateWith(GravitySimulation(1000, 0, widget.height, 0));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => SizedBox(
          width: double.infinity,
          height: _controller.value,
          child: Container(color: Colors.green),
        ),
      );
}
