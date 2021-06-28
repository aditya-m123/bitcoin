import 'package:flutter/material.dart';
import 'package:myapp/calculatorscreen/input_page.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.black),
      home: InputPage(),
    );
  }
}
