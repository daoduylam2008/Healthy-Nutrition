import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/file_manager.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:table_calendar/table_calendar.dart';

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
                      child: Text(
                        "History",
                        style: nunitoFont(
                          50,
                          foregroundColor,
                          FontStyle.normal,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    )               ],
                );
              }
              return Center(child: const CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}
