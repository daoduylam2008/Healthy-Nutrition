import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/nutrientsDistribution.dart';
import 'package:healthy_nutrition/widgets/vitaminContainer.dart';
import 'package:healthy_nutrition/widgets/weeklyNutrients.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreen();
}

class _AnalysisScreen extends State<AnalysisScreen> {
  List<DateTime> datesOfTheWeek = getDaysInTheWeek(today);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserInfo info = snapshot.data!;
          List<Map<String, dynamic>> history = [];
          for (final date in datesOfTheWeek) {
            if (info.history[date.dateToString()] != null) {
              for (final food in info.history[date.dateToString()]) {
                history.add(food);
              }
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
            return SafeArea(
              bottom: false,
              minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
              child: RefreshIndicator(
                color: signatureColor,
                displacement: 90,
                onRefresh: () async {
                  final can = await Haptics.canVibrate();
                  UserInfo _info;
                  _info = (await fetchUserInfo())!;

                  setState(() {
                    info = _info;
                  });
                  if (!can) return;
                  await Haptics.vibrate(HapticsType.success);
                },
                child: Stack(
                  children: [
                    ListView(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Analysis",
                          style: interFont(
                            32,
                            white,
                            FontStyle.normal,
                            FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Your history does not have enough data for analyzing",
                          textAlign: TextAlign.center,
                          style: interFont(
                            16,
                            white,
                            FontStyle.normal,
                            FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
    
          return FutureBuilder(
            future: fetchFoods(descriptions),
            builder: (context, asyncSnapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> nutritionData = nutritionCalculator(
                  asyncSnapshot.data ?? [],
                  portions,
                  amounts,
                );
                return SafeArea(
                  minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Analysis",
                        style: interFont(
                          32,
                          white,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 48),
                      weeklyNutrients(
                        snapshot.data!,
                        datesOfTheWeek,
                        context,
                      ),
                      SizedBox(height: 60),
                      nutrientsDistributionWidget(nutritionData),
                      SizedBox(height: 49),
                      Text(
                        "Vitamin",
                        style: interFont(
                          24,
                          white,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 26),
                      vitaminContainer(nutritionData),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        }
        return SafeArea(
          minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Analysis",
                style: interFont(
                  32,
                  white,
                  FontStyle.normal,
                  FontWeight.w500,
                ),
              ),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
