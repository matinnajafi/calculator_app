// Equal Button
import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants/constants.dart';

Widget getEqualButton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 72,
      height: 168,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: orangeColor,
        boxShadow: [
          BoxShadow(
            color: whiteColor,
            blurRadius: 10,
            spreadRadius: -10,
            offset: Offset(-4, -4),
          ),
          BoxShadow(
            color: darkWhiteColor,
            blurRadius: 10,
            spreadRadius: -9,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: const Center(
        child: Text('=', style: TextStyle(fontSize: 48, color: whiteColor)),
      ),
    ),
  );
}
