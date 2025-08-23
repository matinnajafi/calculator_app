import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants/constants.dart';

// Calculator Button Widget
class SingleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final double fontSize;

  SingleButton({
    required this.label,
    required this.onTap,
    this.color = greyColor,
    this.fontSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              spreadRadius: -10,
              offset: Offset(-3, -3),
            ),
            BoxShadow(
              color: Colors.white54,
              blurRadius: 10,
              spreadRadius: -9,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: fontSize, color: _getTextColor(label)),
          ),
        ),
      ),
    );
  }

  // A helper method to determine the text color
  Color _getTextColor(String text) {
    return isOperator(text) ? orangeColor : Colors.white;
  }

  // A helper method to check if the text is an operator
  bool isOperator(String text) {
    var operatorList = ['ac', '÷', '×', '–', '+', '%'];
    return operatorList.contains(text);
  }
}
