import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants/constants.dart';
import 'package:flutter_calculator_app/providers/calculator_provider.dart';
import 'package:flutter_calculator_app/widgets/column_buttons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          children: [
            getResultContainer(calculator),
            const Divider(thickness: 0.7, color: greyColor),
            getButtonsContainer(context),
          ],
        ),
      ),
    );
  }

  Widget getResultContainer(CalculatorProvider calculator) {
    return Expanded(
      flex: 5,
      child: Container(
        color: blackColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: whiteColor),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                height: 210,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: whiteColor,
                          blurRadius: 14,
                          spreadRadius: -10,
                          offset: Offset(-4, -4),
                        ),
                        BoxShadow(
                          color: blackColor,
                          blurRadius: 6,
                          spreadRadius: -9,
                          offset: Offset(4, 4),
                        ),
                      ],
                      color: blackColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              child: Text(
                                calculator.input,
                                maxLines: 2,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget getButtonsContainer(context) {
    return Expanded(
      flex: 8,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getColumnButtons('ac', '7', '4', '1', '%', context),
            getColumnButtons('÷', '8', '5', '2', '0', context),
            getColumnButtons('×', '9', '6', '3', '.', context),
            getOperatorsColumn(context),
          ],
        ),
      ),
    );
  }
}
