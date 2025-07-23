import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/widgets/factorsPieChart.dart';
import 'package:healthy_nutrition/widgets/fatContainer.dart';
import 'package:healthy_nutrition/widgets/healthProfileContainer.dart';
import 'package:healthy_nutrition/widgets/mineralContainer.dart';
import 'package:healthy_nutrition/widgets/vitaminContainer.dart';

class SpecificNutrition extends StatefulWidget {
  DateTime date;
  UserInfo info;
  final Map<String, dynamic> data;
  SpecificNutrition({super.key, required this.data, required this.date, required this.info});

  @override
  State<SpecificNutrition> createState() => _SpecificNutrition();
}

class _SpecificNutrition extends State<SpecificNutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: boxColor,
                    radius: 30,
                    child: BackButton(color: white),
                  ),
                  Text("History", style: interFont(32, white, FontStyle.normal, FontWeight.w500),),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: BackButton(color: white),
                  ),
                ],
              ),
              SizedBox(height: 37),
              Text(widget.date.dateToString(), style: interFont(32, white, FontStyle.normal, FontWeight.w500),),
              SizedBox(height: 37),
              healthProfileContainer(widget.info, widget.date, false, context),
              SizedBox(height: 50),
              factorsPieChart(widget.data),
              SizedBox(height: 46),
              Text(
                "Vitamins",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              vitaminContainer(widget.data),
              SizedBox(height: 60),
              Text(
                "Mineral",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              mineralContainer(widget.data),
              SizedBox(height: 60),
              Text(
                "Fat",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              fatContainer(widget.data, context),
            ],
          ),
        ),
      ),
    );
  }
}
