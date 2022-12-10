import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';

void main() {
  runApp(const FractionsApp());
}

class FractionsApp extends StatelessWidget {
  const FractionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final x = Fraction.fromDouble(0.3333, precision: 1e-1);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Fractions: 1/a 333/444 $x ${0.3333.toFraction().toString()}',
            style: const TextStyle(
              fontFamily: 'Ubuntu Mono',
              fontSize: 66,
              fontFeatures: [
                FontFeature.fractions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
