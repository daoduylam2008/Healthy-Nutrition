import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';

Widget healthProfileContainer(UserInfo info, bool history, double width, DateTime date) {
  List todayHistoryFood = info.history[date.dateToString()];
  List todayHistory = [];

  for (final i in todayHistoryFood) {
    todayHistory.add(i["description"]);
  }

  return Container(
    padding: EdgeInsets.only(top: 17, bottom: 17, right: 23, left: 23),
    width: double.infinity,
    height: 227,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    child: FutureBuilder(
      future: fetchFoods(todayHistory),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = nutritionCalculator(snapshot.data!);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              // SizedBox(height: 16),
              caloriesBar(data["Energy"], width),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  nutritionSection(
                    "Carbs",
                    data["Carbs"],
                    width,
                    Colors.yellow,
                    300,
                  ),
                  nutritionSection(
                    "Protein",
                    data["Protein"],
                    width,
                    Colors.red,
                    100,
                  ),
                  nutritionSection(
                    "Fat",
                    data["Fat"],
                    width,
                    Colors.pinkAccent,
                    60,
                  ),
                ],
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
  );
}

Widget nutritionSection(
  String type,
  double value,
  double width,
  Color color,
  double maxValue,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        type,
        style: interFont(16, white, FontStyle.normal, FontWeight.normal),
      ),
      Stack(
        children: [
          Container(
            width: width * 0.22,
            height: 6,
            decoration: BoxDecoration(
              color: inactiveColor,
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
          Container(
            width: width * 0.22 * (value / maxValue),
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              "$value ",
              overflow: TextOverflow.ellipsis,
              style: interFont(14, white, FontStyle.normal, FontWeight.normal),
            ),
          ),
          Text(
            "/ ${maxValue}g",
            style: interFont(
              14,
              inactiveColor,
              FontStyle.normal,
              FontWeight.normal,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget caloriesBar(double value, double width) {
  double barWidth = width * 0.8;
  return Stack(
    alignment: Alignment(0, 0.5),
    children: [
      Stack(
        children: [
          Container(
            height: 6,
            width: barWidth,
            decoration: BoxDecoration(
              color: inactiveColor,
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
          Container(
            height: 6,
            width: barWidth * value / 3000,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(3.5),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "1000",
                style: interFont(
                  14,
                  (value >= 1000) ? Colors.green : white,
                  FontStyle.normal,
                  FontWeight.normal,
                ),
              ),
              Container(
                width: 6,
                height: 20,
                decoration: BoxDecoration(
                  color: (value >= 1000) ? Colors.green : blurTextColor,
                  borderRadius: BorderRadius.circular(3.5),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "2000",
                style: interFont(
                  14,
                  (value >= 2000) ? Colors.green : white,
                  FontStyle.normal,
                  FontWeight.normal,
                ),
              ),
              Container(
                width: 6,
                height: 20,
                decoration: BoxDecoration(
                  color: (value >= 2000) ? Colors.green : blurTextColor,
                  borderRadius: BorderRadius.circular(3.5),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
