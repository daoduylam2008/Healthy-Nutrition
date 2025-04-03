import 'package:flutter/material.dart';
import 'package:healthy_nutrition/models.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  var user = userExample;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Today"), Text("Hello")],
        ),
      ),
    );
  }

  Widget todayWidget(Map<String, dynamic> history) {
    var data = history[today];
    return Text("data");
  }
}
