import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/caloriesColumnChart.dart';

const Color _proteinColor = Color(0xFF55BC9E);
const Color _carbsColor = Color(0xFF2A51A0);
const Color _fatColor = Color(0XFFFA8564);

Widget weeklyNutrients(
  UserInfo info,
  List<DateTime> dates,
  BuildContext context,
) {
  var size = MediaQuery.of(context).size;
  var width = size.width;

  return Container(
    height: 370,
    width: double.infinity,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    padding: EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weekly Nutrients",
          style: interFont(24, white, FontStyle.normal, FontWeight.w500),
        ),
        SizedBox(height: 11),
        Row(
          spacing: 20,
          children: [
            _chartLabel("Protein", _proteinColor),
            _chartLabel("Carbs", _carbsColor),
            _chartLabel("Fat", _fatColor),
          ],
        ),
        SizedBox(
          width: width * 0.74,
          height: 250,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemExtent: 48,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _columnChart(info, dates[index]),
                    SizedBox(height: 9),
                    Text(
                      dates[index].date()[0],
                      style: interFont(
                        14,
                        white,
                        FontStyle.normal,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _chartLabel(String unit, Color color) {
  return Row(
    children: [
      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      SizedBox(width: 5),
      Text(
        unit,
        style: interFont(14, white, FontStyle.normal, FontWeight.normal),
      ),
    ],
  );
}

Widget _columnChart(UserInfo info, DateTime date) {
  var maxValue = double.parse(info.goal["carbs"]) + double.parse(info.goal["protein"])+ double.parse(info.goal["fat"]);
  List<Map<String, dynamic>> history = [];

  if (info.history[date.dateToString()] != null) {
    for (final food in info.history[date.dateToString()]) {
      history.add(food);
    }
  }

  List<String> descriptions = [];
  List<int> portions = [];
  List<int> amounts = [];

  for (final i in history) {
    descriptions.add(i["description"]);
    portions.add(i["portion"]);
    amounts.add(int.parse(i["amount"]));
  }

  if (descriptions.isEmpty) {
    return SizedBox();
  }

  return FutureBuilder(
    future: fetchFoods(descriptions),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        Map<String, dynamic> data = nutritionCalculator(snapshot.data!, portions, amounts);
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 2,
          children: [
            Container(
              decoration: BoxDecoration(
                color: _proteinColor,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 34,
              height: (data["Protein"] >= double.parse(info.goal["protein"])) ? double.parse(info.goal["protein"]) * 208 / maxValue : data["Protein"] * 208 / maxValue,
            ),
            Container(
              decoration: BoxDecoration(
                color: _carbsColor,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 34,
              height: (data["Carbs"] >= double.parse(info.goal["carbs"])) ? double.parse(info.goal["carbs"]) * 208 / maxValue : data["Carbs"] * 208 / maxValue,
            ),
            Container(
              decoration: BoxDecoration(
                color: _fatColor,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 34,
              height: (data["Fat"] >= double.parse(info.goal["fat"])) ? double.parse(info.goal["fat"]) * 208 / maxValue : data["Fat"] * 208 / maxValue,
            ),
          ],
        );
      }
      return Center(child: CircularProgressIndicator());
    },
  );
}
