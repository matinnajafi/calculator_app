import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider with ChangeNotifier {
  String _inputUser = '';
  String _result = '';
  double _scale = 1.0;
  Timer? _deleteTimer;

  String get input => _inputUser;
  String get result => _result;
  double get scale => _scale;

  void buttonPressed(String text) {
    _inputUser += text;
    notifyListeners();
  }

  void clearInput() {
    _inputUser = '';
    _result = '';
    notifyListeners();
  }

  void deleteLastCharacter() {
    if (_inputUser.isNotEmpty) {
      _inputUser = _inputUser.substring(0, _inputUser.length - 1);
      notifyListeners();
    }
  }

  void onTapDown(TapDownDetails details) {
    _scale = 0.9;
    notifyListeners();
  }

  void onTapUp(TapUpDetails details) {
    _scale = 1.0;
    notifyListeners();
  }

  // Corrected method to delete characters step-by-step
  void startDeleting() {
    // Delete the first character immediately for responsiveness
    deleteLastCharacter();
    _deleteTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_inputUser.isNotEmpty) {
        deleteLastCharacter(); // Use the existing method
      } else {
        _deleteTimer?.cancel();
      }
    });
  }

  void stopDeleting() {
    _deleteTimer?.cancel();
    _scale = 1.0;
    notifyListeners();
  }

  void calculateResult() {
    if (_inputUser.isNotEmpty &&
        (_inputUser.endsWith('-') ||
            _inputUser.endsWith('+') ||
            _inputUser.endsWith('/') ||
            _inputUser.endsWith('*') ||
            _inputUser.endsWith('%'))) {
      _inputUser = _inputUser.substring(0, _inputUser.length - 1);
    }

    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_inputUser);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      _result = eval.toString();
    } catch (e) {
      _result = _inputUser.isEmpty ? '' : 'Error';
    }
    notifyListeners();
  }
}
