import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  late final _element = StatelessElement(this);

  var counter = 0;

  @override
  StatelessElement createElement() => _element;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: InkWell(
            child: Text("Nothing - $counter",
                style: TextStyle(
                  fontSize: 20,
                )),
            onTap: () {
              counter++;
              print(counter);
              _element.markNeedsBuild();
            },
          ),
        ),
      ),
    );
  }
}
