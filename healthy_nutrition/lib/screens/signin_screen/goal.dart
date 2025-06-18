import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/screens/signin_screen/register.dart';
import 'package:healthy_nutrition/widgets/processWidget.dart';

class GoalScreen extends StatefulWidget {
  Map<String, dynamic> saveData;

  GoalScreen({super.key, required this.saveData});

  @override
  State<GoalScreen> createState() => _GoalScreen();
}

class _GoalScreen extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(right: 30, left: 30, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                      CircleAvatar(
                        backgroundColor: boxColor,
                        radius: 30,
                        child: BackButton(color: white),
                      ),
                      SizedBox(width: 30),
                      processWidget(2)
                  ],
                ),
                SizedBox(height: 18),
                Text("Set your goal", style: interFont(32, white, FontStyle.normal, FontWeight.w500)),
            
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(saveData: widget.saveData,),
                  ),
                );
              },
              child: Container(
                height: 77,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Center(child: Text("Continue", style: interFont(16, white, FontStyle.normal, FontWeight.w500),),),
              ),
            )
          ],
        )
      ),
    );
  }
}
