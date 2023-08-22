import 'package:flutter/material.dart';

const primaryColor = Color(0xFF222165);
const secondaryColor = Color(0xFFF2F2FF);
const thirdColor = Color(0xFF7280FF);

const buttonGrayColor = Color(0xFFEAEAEA);

const blackColor = Colors.black;
const grayColor = Color(0xFFA8A8A8);
const grayDarkColor = Color(0xFF4D4D4D);
const whiteColor = Colors.white;
const greenColor = Color(0xFF57AA56);
const redColor = Color(0xFFBA2829);
const orangeColor = Color(0xFFFF8A00);
const blueGreyColor = Color(0xFFF3F6F9);

MaterialColor getPrimaryMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
