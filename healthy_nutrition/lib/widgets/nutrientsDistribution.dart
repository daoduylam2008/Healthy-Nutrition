import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:pie_chart/pie_chart.dart';

Widget nutrientsDistributionWidget(
  Map<String, dynamic> data,
) {
  final Map<String, double> baseDistributedData = {};
  for (final i in data.keys.toList()) {
    if (i != "Protein" && i != "Carbs" && i != "Energy" && i != "Fat" && !i.contains("Vitamin") && !i.contains("Water") && !i.contains("Total")) {
      baseDistributedData[i] = data[i];
    }
  }
  return Container(
    width: double.infinity,
    height: 350,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(38),
    ),
    padding: EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Consumption", style: interFont(24, white, FontStyle.normal, FontWeight.w500),),
        SizedBox(height: 20,),
        PieChart(
          legendOptions: LegendOptions(
            legendTextStyle: interFont(14, white, FontStyle.normal, FontWeight.normal),
            legendShape: BoxShape.rectangle,
          ),
          dataMap: baseDistributedData,
          chartValuesOptions: ChartValuesOptions(
            showChartValues: false
            ),
          ),
      ],
    ),
  );
}
