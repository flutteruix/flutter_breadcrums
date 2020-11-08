import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Breadcrum Example",
      theme: ThemeData(
        primarySwatch : Colors.blue,
        visualDensity : VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
