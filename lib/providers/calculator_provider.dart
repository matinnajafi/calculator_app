import 'package:flutter/material.dart';

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

  void calculateResult() {
    try {
      // Some things to do to perform the operation
    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }

  // this method deletes the last character from the input string (for backspace button)
  void deleteLastCharacter() {
    if (_inputUser.isNotEmpty) {
      _inputUser = _inputUser.substring(0, _inputUser.length - 1);
      notifyListeners();
    }
  }
}
