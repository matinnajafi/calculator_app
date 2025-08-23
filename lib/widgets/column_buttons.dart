import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/widgets/calculate_button.dart';

Widget getColumnButtons(
  String text1,
  String text2,
  String text3,
  String text4,
  String text5,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CalculatorButton(label: text1, onTap: () {}),
      CalculatorButton(label: text2, onTap: () {}),
      CalculatorButton(label: text3, onTap: () {}),
      CalculatorButton(label: text4, onTap: () {}),
      CalculatorButton(label: text5, onTap: () {}),
    ],
  );
}
