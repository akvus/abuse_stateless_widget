// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'A',
                style: TextStyle(fontSize: 45),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BWidget()));
                  },
                  child: const Text('SWITCH')),
            ],
          ),
        ),
      );
}

class BWidget extends StatelessWidget {
  const BWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'B',
                style: TextStyle(fontSize: 45),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 2000), () {
                    print(context);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      );
}
