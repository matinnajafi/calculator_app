import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/providers/calculator_provider.dart';
import 'package:flutter_calculator_app/widgets/buttons/backspace_button.dart';
import 'package:flutter_calculator_app/widgets/buttons/equal_button.dart';
import 'package:flutter_calculator_app/widgets/buttons/single_button.dart';
import 'package:provider/provider.dart';

// Column Buttons Widget
Widget getColumnButtons(
  String text1,
  String text2,
  String text3,
  String text4,
  String text5,
  context,
) {
  final calculator = Provider.of<CalculatorProvider>(context);
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SingleButton(
        label: text1,
        onTap: () {
          calculator.buttonPressed(text1);
        },
      ),
      SingleButton(
        label: text2,
        onTap: () {
          calculator.buttonPressed(text2);
        },
      ),
      SingleButton(
        label: text3,
        onTap: () {
          calculator.buttonPressed(text3);
        },
      ),
      SingleButton(
        label: text4,
        onTap: () {
          calculator.buttonPressed(text4);
        },
      ),
      SingleButton(
        label: text5,
        onTap: () {
          calculator.buttonPressed(text5);
        },
      ),
    ],
  );
}

// Operators Column Widget
Widget getOperatorsColumn(context) {
  final calculator = Provider.of<CalculatorProvider>(context);
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      getBackSpaceButton(context),
      SingleButton(
        label: '–',
        onTap: () {
          calculator.buttonPressed('-');
        },
      ),
      SingleButton(
        label: '+',
        onTap: () {
          calculator.buttonPressed('+');
        },
      ),
      getEqualButton(context),
    ],
  );
}
