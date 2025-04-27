import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/file_manager.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  DateTime _selectedDay = DateTime.now();

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

                return SingleChildScrollView(
                  child: Column(
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
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                        ),
                        calendarStyle: CalendarStyle(

                          weekendTextStyle: TextStyle(
                            fontSize: 16
                          ),
                          defaultTextStyle: TextStyle(fontSize: 16),
                          selectedDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                          ),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: inactiveColor,
                          ),
                          selectedTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          todayTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                          });
                        },
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _selectedDay,
                        currentDay: DateTime.now(),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      nutrientsView(history[_selectedDay.dateToString()]),
                    ],
                  ),
                );
              }
              return Center(child: const CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget nutrientsView(List<dynamic>? history) {
    return FutureBuilder(
      future: loadJsonFromAssets("assets/food_data.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (history == null) {
            return Text("1234");
          }
          Map<String, dynamic> data = snapshot.data!;
          Map<String, dynamic> dateData = {
            "calories": 0,
            "protein": 0,
            "fat": 0,
            "sat.fat": 0,
            "carbs": 0,
            "fiber": 0,
          };

          // Calculate total nutrients in a day
          for (int i = 0; i < history.length; i++) {
            try {
              dateData["calories"] += int.parse(data[history[i]]["Calories"]);
              dateData["protein"] += int.parse(data[history[i]]["Protein"]);
              dateData["fat"] += int.parse(data[history[i]]["Fat"]);
              dateData["sat.fat"] += int.parse(data[history[i]]["Sat.Fat"]);
              dateData["fiber"] += int.parse(data[history[i]]["Fiber"]);
              dateData["carbs"] += int.parse(data[history[i]]["Carbs"]);
            } catch (e) {
              print(e);
            }
          }
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        axes: [
                          RadialAxis(
                            canScaleToFit: true,
                            radiusFactor: .5,
                            showLabels: false,
                            showTicks: false,
                            minimum: 0,
                            maximum: 100,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.2,
                              cornerStyle: CornerStyle.bothCurve,
                              color: Color.fromARGB(30, 0, 169, 181),
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text("123")
                  ],
                ),
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
