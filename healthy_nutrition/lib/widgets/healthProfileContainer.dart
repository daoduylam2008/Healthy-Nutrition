import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';

Widget healthProfileContainer(UserInfo info, bool history, double width) {
  List todayHistory = info.history[todayTest.dateToString()];

  return Container(
    padding: EdgeInsets.only(top: 17, bottom: 17, right: 23, left: 23),
    width: double.infinity,
    height: 227,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    child: FutureBuilder<List<Food>?>(
      future: fetchFoods(todayHistory),
      builder: (context, snapshot) {
        Map<String, dynamic> data = nutritionCalculator(snapshot.data!);

        if (snapshot.hasData) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${data["Energy"]}",
                        style: interFont(
                          48,
                          white,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Kcal",
                        style: interFont(
                          24,
                          white,
                          FontStyle.normal,
                          FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image(image: AssetImage("assets/icons/fire.png")),
                      SizedBox(width: 15),
                    ],
                  ),
                ],
              ),
              caloriesBar(data["Energy"], width),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  nutritionSection("Carbs", data["Carbs"], width, Colors.yellow),
                  nutritionSection("Protein", data["Protein"], width, Colors.red),
                  nutritionSection("Fat", data["Fat"], width, Colors.pinkAccent),
                ],
              )
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
  );
}

Widget nutritionSection(String type, double value, double width, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(type, style: interFont(18, white, FontStyle.normal, FontWeight.normal)),
      Stack(
        children: [
          Container(
            width: width*0.22,
            height: 6,
            decoration: BoxDecoration(
              color: inactiveColor,
              borderRadius: BorderRadius.circular(3.5)
            ),
          ),
          Container(
            width: width * 0.22 * (value / 24),
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.5)
            ),
          ),
        ],
      ),
      Row(children: [
        Text("$value ", style: interFont(16, white, FontStyle.normal, FontWeight.normal)),
        Text("/ 24.0g", style: interFont(16, inactiveColor, FontStyle.normal, FontWeight.normal),)
      ],)
  ],);
}

Widget caloriesBar(double value, double width) {
  double barWidth = width * 0.6;
  return Container(
    width: barWidth,
    decoration: BoxDecoration(
      color: inactiveColor,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Container(),
  );
}
