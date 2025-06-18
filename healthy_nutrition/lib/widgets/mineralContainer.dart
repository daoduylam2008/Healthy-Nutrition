import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';

Widget mineralContainer(Map<String, dynamic> data, BuildContext context) {
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
    height: 64 * _mineralsColors.length * 1,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    padding: EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 15),
    child: ListView.builder(
      itemCount: minerals.length,
      itemExtent: 81,
      itemBuilder: (context, index) {
        return _vitaminInfo(
          minerals[index],
          _mineralsColors[index],
          data[minerals[index]],
          context,
        );
      },
    ),
  );
}

Widget _vitaminInfo(
  String name,
  Color color,
  double value,
  BuildContext context,
) {
  var size = MediaQuery.of(context).size;
  var width = size.width;

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
            Stack(
              children: [
                Container(
                  height: 7,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.5),
                    color: inactiveColor
                  ),
                ),
                Container(
                  height: 7,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.5),
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
