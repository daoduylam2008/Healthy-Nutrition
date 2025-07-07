import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/widgets/foodBox.dart';
import 'package:healthy_nutrition/widgets/healthProfileContainer.dart';

Widget historyNutritionView(
  UserInfo info,
  DateTime date,
  double width,
  int? maxValue,
  bool isHistory,
) {
  if (info.history[date.dateToString()] == null) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You did not scan any food on this day!!!",
          style: interFont(16, white, FontStyle.normal, FontWeight.normal),
        ),
      ],
    );
  }
  List history = info.history[date.dateToString()];

  List historyFood = [];

  for (final i in history) {
    historyFood.add(i["description"]);
  }

  return FutureBuilder(
    future: fetchFoods(historyFood),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Widget> currentScans = [];
        List<Food> data = snapshot.data!;
        int maxRange = 0;
        if (maxValue != null) {
          maxRange = (history.length >= maxValue) ? maxValue : history.length;
        } else {
          maxRange = history.length;
        }


        for (var i = 0; i < maxRange; i++) {
          currentScans.add(
            foodBox(
              history[i]["portion"],
              null,
              data[i],
              int.parse(history[i]["amount"]),
              info,
              context,
            ),
          );
        }
        return Column(
          children: [
            (isHistory == true)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      healthProfileContainer(info, true, width, date, context),
                      SizedBox(height: 28),
                      Text(
                        "Food",
                        style: interFont(
                          24,
                          white,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 28),
            Column(children: currentScans),
          ],
        );
      }
      return Center(child: CircularProgressIndicator());
    },
  );
}
