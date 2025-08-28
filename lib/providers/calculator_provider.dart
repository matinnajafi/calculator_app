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
}
