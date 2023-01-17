import 'package:flutter/material.dart';

void main() {
  runApp(BuildOwnerPlaygroundApp());
}

class BuildOwnerPlaygroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: _BodyWidget()),
    );
  }
}

var buildCountAllInstance = 0;
var clickCount = 0;

class _BodyWidget extends StatelessWidget {
  var buildCountCurrentIntance = 0;

  @override
  Widget build(BuildContext context) {
    buildCountAllInstance++;
    buildCountCurrentIntance++;

    final buildOwner = (context as Element).owner;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Build count all: $buildCountAllInstance'),
          Text('Build count curr: $buildCountCurrentIntance'),
          Text('Click count: $clickCount'),
          Text('Global keys count: ${buildOwner?.globalKeyCount}'),
          InkWell(
            child: Text('CCC'),
            onTap: () {
              clickCount++;
              buildOwner?.lockState(() {
                (context as StatelessElement).update(_BodyWidget());
              });
            },
          ),
        ],
      ),
    );
  }
}
