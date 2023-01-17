import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

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

class MyStatefulWidget extends ConsumerWidget {
  const MyStatefulWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(someStateNotifierProvider);

    return Scaffold(
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
                      builder: (context) => const SizedBox()));
                },
                child: Text('SWITCH $state')),
          ],
        ),
      ),
    );
  }
}

final someStateNotifierProvider = StateNotifierProvider.autoDispose(
  (ref) {
    final other = ref.read(someOtherClassProvider);

    ref.onDispose(() {
      other.onDisepose();
    });

    return SomeStateNotifier(other, false);
  },
);

class SomeStateNotifier extends StateNotifier<bool> {
  SomeStateNotifier(this._someOtherClass, super.state);

  final SomeOtherClass _someOtherClass;
}

final someOtherClassProvider = Provider.autoDispose((ref) => SomeOtherClass());

class SomeOtherClass {
  void onDisepose() {
    print('called');
  }
}
