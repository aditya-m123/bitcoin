import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculate_Brain {
  Calculate_Brain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBmI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'Underweight';
    }
  }

  String getInterpredation() {
    if (_bmi >= 25) {
      return 'Start doing exercise ';
    } else if (_bmi > 18.5) {
      return 'try abs';
    } else {
      return 'have good food to bulk';
    }
  }
}
