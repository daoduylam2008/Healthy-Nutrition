import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';

Widget mineralContainer(Map<String, dynamic> data) {
  List minerals = [];
  List<Color> _mineralsColors = [
    Color(0xFF73FF67),
    Color(0xFF82B2FF),
    Color(0xFFFB82FF),
    Color(0xFFFF8284),
    Color(0xFFFFFF48),
    Color(0xFF73FF67),
    Color(0xFF82B2FF),
    Color(0xFFFB82FF),
    Color(0xFFFF8284),
    Color(0xFFFFFF48),
  ];

  for (final i in data.keys.toList()) {
    if (i.contains("-M")) {
      minerals.add(i);
    }
  }

  return Container(
    width: double.infinity,
    height: 840,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    padding: EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: minerals.length,
      itemExtent: 81,
      itemBuilder: (context, index) {
        return _vitaminInfo(
          minerals[index],
          _mineralsColors[index],
          data[minerals[index]],
        );
      },
    ),
  );
}

Widget _vitaminInfo(String name, Color color, double value) {
  double v = double.parse("${value / 0.000001}").roundNum(1);
  String unit = "µg";
  if (v > 500) {
    v = value;
    unit = "g";
  }
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: Row(
      children: [
        CircleAvatar(backgroundColor: color, radius: 24),
        SizedBox(width: 30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: interFont(16, white, FontStyle.normal, FontWeight.normal),
            ),
            SizedBox(width: 10),
            Text(
              "${v.roundNum(3)}$unit",
              style: interFont(14, white, FontStyle.normal, FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
