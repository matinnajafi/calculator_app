import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider with ChangeNotifier {
  String _inputUser = '';
  String _result = '';

  String get input => _inputUser;
  String get result => _result;

  void buttonPressed(String text) {
    _inputUser += text;
    notifyListeners(); // This tells widgets to rebuild
  }

  void clearInput() {
    _inputUser = '';
    _result = '';
    notifyListeners();
  }

  // this method deletes the last character from the input string (for backspace button)
  void deleteLastCharacter() {
    if (_inputUser.isNotEmpty) {
      _inputUser = _inputUser.substring(0, _inputUser.length - 1);
      notifyListeners();
    }
  }

  void calculateResult() {
    // Check if the last character is an operator
    if (input.isNotEmpty &&
        (input.endsWith('-') ||
            input.endsWith('+') ||
            input.endsWith('/') ||
            input.endsWith('*') ||
            input.endsWith('%'))) {
      _inputUser = input.substring(0, input.length - 1);
    }

    try {
      Parser parser = Parser();
      Expression expression = parser.parse(input);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);

      _result = eval.toString();
    } catch (e) {
      if (input.isEmpty) {
        _result = '';
      } else {
        _result = 'Error';
      }
    }
    notifyListeners();
  }
}
