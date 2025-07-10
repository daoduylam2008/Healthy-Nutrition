import 'package:healthy_nutrition/constants.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

Widget factorsPieChart(Map<String, dynamic> data) {
  List<Color> colorList = [
    Color(0xFFFFFF48),
    Color(0xFFFF5151),
    Color(0xFFFB82FF),
  ];
  Map<String, double> dataMap = {"Carbs": data["Carbs"].toDouble(), "Protein": data["Protein"].toDouble(), "Fat": data["Fat"].toDouble()};

  return PieChart(
    chartLegendSpacing: 10,
    chartRadius: 209,
    ringStrokeWidth: 25,
    dataMap: dataMap, 
    legendOptions: LegendOptions(
      legendTextStyle: interFont(14, white, FontStyle.normal, FontWeight.normal),
      legendShape: BoxShape.rectangle,
      legendLabels: {
        "Carbs": "C", 
        "Protein": "P",
        "Fat": "F"
      }
    ),
    emptyColor: backgroundColor,
    colorList: colorList,
    chartType: ChartType.ring,
    chartValuesOptions: ChartValuesOptions(
      showChartValues: true
    ),
    centerWidget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data["Energy"].toString(), style: interFont(24, white, FontStyle.normal, FontWeight.bold),),
            SizedBox(width: 5),
            Text("kcal", style: interFont(24, inactiveColor, FontStyle.normal, FontWeight.bold))
          ],
        ),
        Image(image: AssetImage("assets/icons/fire.png"))
      ],
    ),
    );
}
