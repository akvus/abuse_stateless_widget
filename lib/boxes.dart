import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: BoxesApp(),
  ));
}

class BoxesApp extends ConsumerWidget {
  const BoxesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            child: SizedOverflowBox(
              size: const Size(100, 300),
              child: Container(
                width: 400,
                color: Colors.red,
                child: const Text('Hello World!'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
