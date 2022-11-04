// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const WhyToDisposeExample());
}

class WhyToDisposeExample extends StatefulWidget {
  const WhyToDisposeExample({super.key});

  @override
  _WhyToDisposeExampleState createState() => _WhyToDisposeExampleState();
}

class _WhyToDisposeExampleState extends State<WhyToDisposeExample>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController =
      PageController(); // extends ScrollController
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
