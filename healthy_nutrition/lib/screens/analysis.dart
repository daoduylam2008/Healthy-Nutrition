import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/weeklyNutrients.dart';


class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});
  
  @override
  State<AnalysisScreen> createState() => _AnalysisScreen();
}


class _AnalysisScreen extends State<AnalysisScreen> {
  List<DateTime> datesOfTheWeek = getDaysInTheWeek(todayTest);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Analysis", style: interFont(32, white, FontStyle.normal, FontWeight.w500)),
                  SizedBox(height: 68),
                  weeklyNutrients(snapshot.data!, datesOfTheWeek, context)
                ]
              )
            );
          }
          return SafeArea(
            minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Analysis", style: interFont(32, white, FontStyle.normal, FontWeight.w500)),
                CircularProgressIndicator()
              ]
            )
          );
        }
      ),
    );
  }
}
