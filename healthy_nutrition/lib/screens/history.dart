import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/file_manager.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
      child: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot1) {
          return FutureBuilder(
            future: loadJsonFromAssets("assets/food_data.json"),
            builder: (context, snapshot2) {
              if (snapshot1.hasData && snapshot2.hasData) {
                UserInfo info = snapshot1.data!;
                Map<String, dynamic> history = info.history;
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("History",
                      style: nunitoFont(50, foregroundColor, FontStyle.normal, FontWeight
                      .bold)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: history.keys.toList().length,
                        itemBuilder: (context, index) {
                          String date = history.keys.toList()[index];
                          return historyCard(date, history[date]);
                        },
                      ),
                    ),
                  ],
                );
              }
              return Center(child: const CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget historyCard(String date, List<dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              date,
              style: robotoFont(20, foregroundColor, FontStyle.normal, FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
