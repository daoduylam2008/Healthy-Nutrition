import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String apiKey = "BUMkFqihTdLYxFb4qi1psoxY6c9vldorsVcLk8eL";

const backgroundColor = Color.fromARGB(255, 51, 52, 51);
const foregroundColor = Color(0xFFEEE9E9);
const white = Color(0xFFFFFFFF);
const tabBarColor = Color.fromRGBO(0, 0, 0, 0.309);
const inactiveColor = Color.fromARGB(255, 69, 69, 69);
const boxColor = Color.fromARGB(132, 58, 57, 57);
const textColor = Color.fromARGB(229, 255, 255, 255);
const blurTextColor = Color.fromARGB(160, 238, 233, 233);
ThemeData theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: foregroundColor,
);

const url = "http://localhost:3000";

TextStyle latoFont(
  double size,
  Color color,
  FontStyle style,
  FontWeight? weight,
) {
  return GoogleFonts.lato(
    fontSize: size,
    color: color,
    fontStyle: style,
    fontWeight: weight,
  );
}

TextStyle robotoFont(
  double size,
  Color color,
  FontStyle style,
  FontWeight? weight,
) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontStyle: style,
    fontWeight: weight,
  );
}

TextStyle nunitoFont(
  double size,
  Color color,
  FontStyle style,
  FontWeight? weight,
) {
  return GoogleFonts.nunito(
    fontSize: size,
    color: color,
    fontStyle: style,
    fontWeight: weight,
  );
}
