import 'package:flutter/material.dart';
import 'package:myapp/calculatorscreen/constants.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({required this.text, this.on_BottomPressed});

  String text;
  final VoidCallback? on_BottomPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on_BottomPressed,
      child: Center(
        child: Text(text, style: kLarge_TextStyle),
      ),
    );
  }
}
