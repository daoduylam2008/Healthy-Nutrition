import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/widgets/weeklyNutrients.dart';


class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});
  
  @override
  State<AnalysisScreen> createState() => _AnalysisScreen();
}


class _AnalysisScreen extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Analysis", style: interFont(32, white, FontStyle.normal, FontWeight.w500)),
          weeklyNutrients()
        ]
      )
    );
  }
}
