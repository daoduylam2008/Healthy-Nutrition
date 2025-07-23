import 'package:flutter/material.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/widgets/historyNutritionView.dart';

class HistoryScanScreen extends StatefulWidget {
  UserInfo info;
  DateTime date;
  HistoryScanScreen({super.key, required this.date, required this.info});
  @override
  State<HistoryScanScreen> createState() => _HistoryScanScreen();
}

class _HistoryScanScreen extends State<HistoryScanScreen> {
  var size, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;

    return Scaffold(
      body: SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: historyNutritionView(widget.info, widget.date, width, null, false),
      ),
    );
  }
}
