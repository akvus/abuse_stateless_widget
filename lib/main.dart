import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(),
              InkWell(
                  child: MyWidget(counter: _counter),
                  onTap: () {
                    setState(() {
                      _counter++;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text('Click me'),
      onTap: () {
        final state = context.findAncestorStateOfType<_MyAppState>()!;
        state.setState(() {
          state._counter = 12;
        });
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, World! $counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
