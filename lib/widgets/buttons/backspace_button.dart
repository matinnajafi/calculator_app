import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants/constants.dart';
import 'package:flutter_calculator_app/providers/calculator_provider.dart';
import 'package:provider/provider.dart';

// Backspace Button
Widget getBackSpaceButton(context) {
  // Use a Provider.of with listen: false to call methods without
  // rebuilding the entire widget.
  final calculator = Provider.of<CalculatorProvider>(context, listen: false);

  return GestureDetector(
    onTapDown: (details) {
      calculator.onTapDown(details);
    },
    onTapUp: (details) {
      calculator.onTapUp(details);
    },
    onTap: () {
      calculator.deleteLastCharacter();
    },
    onLongPress: () {
      calculator.startDeleting();
    },
    onLongPressUp: () {
      calculator.stopDeleting();
    },
    child: Consumer<CalculatorProvider>(
      // Use a Consumer to listen specifically to the 'scale' property
      // and rebuild only this part of the widget tree.
      builder: (context, calculator, child) {
        return Transform.scale(
          scale: calculator.scale,
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
                child: Icon(
                  Icons.backspace_outlined,
                  color: orangeColor,
                  size: 32,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
