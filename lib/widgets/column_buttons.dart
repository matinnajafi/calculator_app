import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/widgets/buttons/backspace_button.dart';
import 'package:flutter_calculator_app/widgets/buttons/equal_button.dart';
import 'package:flutter_calculator_app/widgets/buttons/single_button.dart';

// Column Buttons Widget
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
      SingleButton(label: text1, onTap: () {}),
      SingleButton(label: text2, onTap: () {}),
      SingleButton(label: text3, onTap: () {}),
      SingleButton(label: text4, onTap: () {}),
      SingleButton(label: text5, onTap: () {}),
    ],
  );
}

// Operators Column Widget
Widget getOperatorsColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      getBackSpaceButton(),
      SingleButton(label: '–', onTap: () {}),
      SingleButton(label: '+', onTap: () {}),
      getEqualButton(),
    ],
  );
}
