// Backspace Button
import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants/constants.dart';
import 'package:flutter_calculator_app/providers/calculator_provider.dart';
import 'package:provider/provider.dart';

Widget getBackSpaceButton(context) {
  final calculator = Provider.of<CalculatorProvider>(context);
  return GestureDetector(
    onTap: () {
      calculator.buttonPressed('back');
    },
    child: Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: greyColor,
        boxShadow: [
          BoxShadow(
            color: whiteColor,
            blurRadius: 10,
            spreadRadius: -10,
            offset: Offset(-3, -3),
          ),
          BoxShadow(
            color: darkWhiteColor,
            blurRadius: 10,
            spreadRadius: -9,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 3, top: 1),
          child: Icon(Icons.backspace_outlined, color: orangeColor, size: 32),
        ),
      ),
    ),
  );
}
