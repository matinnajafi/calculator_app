import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/widgets/column_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: Colors.deepPurple[200],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                color: Colors.deepPurple[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    getColumnButtons('ac', '7', '4', '1', '%'),
                    getColumnButtons('÷', '8', '5', '2', '0'),
                    getColumnButtons('×', '9', '6', '3', '.'),
                    getColumnButtons('del', '-', '+', '=', '='),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
