import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';

Widget vitaminContainer(Map<String, dynamic> data, BuildContext context) {
  List vitamins = [];
  List<Color> _vitaminsColors = [
    Color(0xFF73FF67),
    Color(0xFF82B2FF),
    Color(0xFFFB82FF),
    Color(0xFFFF8284),
    Color(0xFFFFFF48),
    Color(0xFF73FF67),
    Color(0xFF82B2FF),
    Color(0xFFFB82FF),
  ];

  for (final i in data.keys.toList()) {
    if (i.contains("Vitamin")) {
      vitamins.add(i);
    }
  }

  return Container(
    width: double.infinity,
    height: 678,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    padding: EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: vitamins.length,
      itemExtent: 81,
      itemBuilder: (context, index) {
        return _vitaminInfo(
          vitamins[index],
          _vitaminsColors[index],
          data[vitamins[index]],
        );
      },
    ),
  );
}

Widget _vitaminInfo(
  String name,
  Color color,
  double value,
) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: Row(
      children: [
        CircleAvatar(backgroundColor: color, radius: 24),
        SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: interFont(16, white, FontStyle.normal, FontWeight.normal),
            ),
            SizedBox(width: 10),
            Text("${double.parse("${value / 0.000001}").roundNum(1)} µg", style: interFont(14, white, FontStyle.normal, FontWeight.bold),),
          ],
        ),
      ],
    ),
  );
}
