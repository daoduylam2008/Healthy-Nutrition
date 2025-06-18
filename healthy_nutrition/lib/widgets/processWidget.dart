import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';

Widget processWidget(int process) {
  return Row(
    children: [
    Container(
      width: 90,
      height: 8,
      decoration: BoxDecoration(
        color: signatureColor,
        borderRadius: BorderRadius.circular(3.5)
      ),
    ),
    SizedBox(width: 8),
    Container(
      width: 90,
      height: 8,
      decoration: BoxDecoration(
        color: (process >= 2) ? signatureColor : inactiveColor,
        borderRadius: BorderRadius.circular(3.5)
      ),
    ),
    SizedBox(width: 8),
    Container(
      width: 90,
      height: 8,
      decoration: BoxDecoration(
        color: (process >= 3) ? signatureColor : inactiveColor,
        borderRadius: BorderRadius.circular(3.5)
      ),
    )
  ]);
}
