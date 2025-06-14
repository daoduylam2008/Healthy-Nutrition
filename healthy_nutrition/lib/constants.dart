import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color constants
const backgroundColor = Color.fromARGB(255, 0, 0, 0);
const foregroundColor = Color(0xFFEEE9E9);
const white = Color(0xFFFFFFFF);
const tabBarColor = Color.fromARGB(255, 34, 34, 34);
const inactiveColor = Color.fromARGB(255, 100, 100, 100);
const boxColor = Color.fromARGB(255, 34, 34, 34);
const textColor = Color.fromARGB(229, 255, 255, 255);
const blurTextColor = Color.fromARGB(255, 176, 174, 174);
const barColor = Color.fromARGB(255, 68, 68, 68);
const signatureColor = Color.fromARGB(255, 76, 228, 255);
const maleColor = Color.fromARGB(255, 76, 228, 255);
const femaleColor = Color.fromARGB(255, 255, 76, 76);

// Date constants
DateTime today = DateTime.now();
DateTime todayTest = DateTime(2025, 5, 28);

ThemeData theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: foregroundColor,
);

// const url = "http://localhost:3000";
const url = "http://10.0.0.77:3000";

TextStyle interFont(
  double size,
  Color color,
  FontStyle style,
  FontWeight? weight,
) {
  return GoogleFonts.inter(
    fontSize: size,
    color: color,
    fontStyle: style,
    fontWeight: weight,
  );
}
