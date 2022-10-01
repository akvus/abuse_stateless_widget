// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();

    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print("SchedulerBinding");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("added at buid");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("I'm a snackbar")));
    });

    return Text(
      'Hello, World!',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
