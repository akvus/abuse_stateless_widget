import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderApp());
}

class SomeModelToBeAccessInAChild {
  SomeModelToBeAccessInAChild(this.title);

  final String title;
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Provider(
          create: (context) => SomeModelToBeAccessInAChild('Title'),
          child: const ChildWidget(),
        ),
        // const SecondChildWidget(),
      ],
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChildOfChildWidget();
  }
}

class ChildOfChildWidget extends StatelessWidget {
  const ChildOfChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SomeModelToBeAccessInAChild>();

    return Center(
      child: Text('First child: ${model.title}'),
    );
  }
}

class SecondChildWidget extends StatelessWidget {
  const SecondChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SomeModelToBeAccessInAChild>();

    return Center(
      child: Text('Second child: ${model.title}'),
    );
  }
}
