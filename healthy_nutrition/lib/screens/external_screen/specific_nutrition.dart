import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/widgets/vitaminContainer.dart';

class SpecificNutrition extends StatefulWidget {
  final Map<String, dynamic> data;
  SpecificNutrition({super.key, required this.data});

  @override
  State<SpecificNutrition> createState() => _SpecificNutrition();
}

class _SpecificNutrition extends State<SpecificNutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: boxColor,
              radius: 40,
              child: BackButton(color: white),
            ),
            SizedBox(height: 46),
            Text(
              "Vitamins",
              style: interFont(24, white, FontStyle.normal, FontWeight.w500),
            ),
            SizedBox(height: 26),
            vitaminContainer(widget.data),
          ],
        ),
      ),
    );
  }
}