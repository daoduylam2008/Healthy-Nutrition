import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';

class GoalEditScreen extends StatefulWidget {
  const GoalEditScreen({super.key});

  @override
  State<GoalEditScreen> createState() => _GoalEditScreen();
}

class _GoalEditScreen extends State<GoalEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundColor: boxColor,
                radius: 30,
                child: BackButton(color: white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
