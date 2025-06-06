import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/widgets/historyNutritionView.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  DateTime _selectedDay = DateTime.now();
  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
      child: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot1) {
          if (snapshot1.hasData) {
            UserInfo info = snapshot1.data!;
            
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
                      weekendTextStyle: TextStyle(fontSize: 16),
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
                  SizedBox(height: 46),
                  historyNutritionView(info, _selectedDay, width, 5, true),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
