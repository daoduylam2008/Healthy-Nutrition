import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/screens/signin_screen/register.dart';
import 'package:healthy_nutrition/widgets/processWidget.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:wheel_picker/wheel_picker.dart';

// ignore: must_be_immutable
class GoalScreen extends StatefulWidget {
  Map<String, dynamic> saveData;

  GoalScreen({super.key, required this.saveData});

  @override
  State<GoalScreen> createState() => _GoalScreen();
}

class _GoalScreen extends State<GoalScreen> {
  var size, height, width;
  String? goal;
  int? calorie;
  int? displayNum;
  Goal? userGoal;
  String errorString = "";

  List<String> data = [
    "US Style Diet",
    "Mediterranean Style Diet",
    "Vegetarian Style Diet",
    "40 30 30 Style Diet",
  ];

  loadGoal() async {
    var data = await getGoalByNameAndCalorie(goal!, calorie!);
    setState(() {
      userGoal = data;
      errorString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(right: 30, left: 30, bottom: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: boxColor,
                        radius: 30,
                        child: BackButton(color: white),
                      ),
                      SizedBox(width: width * 0.04),
                      processWidget(2),
                    ],
                  ),
                  SizedBox(height: 18),
                  Center(
                    child: Text(
                      "Set your goal",
                      style: interFont(
                        32,
                        white,
                        FontStyle.normal,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  Text(
                    "Style",
                    style: interFont(
                      22,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonHideUnderline(
                    child: Container(
                      width: double.infinity,
                      height: 77,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.all(20),
                      child: DropdownButton<String>(
                        value: goal,
                        alignment: Alignment.centerLeft,
                        menuWidth: 200,
                        isExpanded: true,
                        dropdownColor: boxColor,
                        borderRadius: BorderRadius.circular(12),
                        items: data.map((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Text(
                              value,
                              style: interFont(
                                16,
                                white,
                                FontStyle.normal,
                                FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) async {
                          setState(() {
                            goal = value;
                          });

                          if (calorie != null) {
                            await loadGoal();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Calories per day",
                    style: interFont(
                      22,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final can = await Haptics.canVibrate();
                      setState(() {
                        calorie = 1000;
                      });
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsetsGeometry.only(
                              right: 20,
                              left: 20,
                              bottom: 20,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: height * 0.7,
                              child: Column(
                                children: [
                                  Text(
                                    "Calorie per day",
                                    style: interFont(
                                      32,
                                      white,
                                      FontStyle.normal,
                                      FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: WheelPicker(
                                            onIndexChanged:
                                                (index, interactionType) async {
                                                  final can =
                                                      await Haptics.canVibrate();
                                                  setState(() {
                                                    calorie =
                                                        index * 100 + 1000;
                                                    displayNum = index;
                                                  });
                                                  if (!can) return;
                                                  await Haptics.vibrate(
                                                    HapticsType.light,
                                                  );
                                                },
                                            initialIndex: displayNum ?? 0,
                                            itemCount: 16,
                                            style: WheelPickerStyle(
                                              itemExtent: 30,
                                            ),
                                            builder: (context, index) {
                                              return Text(
                                                "${index * 100 + 1000}",
                                                style: interFont(
                                                  20,
                                                  white,
                                                  FontStyle.normal,
                                                  FontWeight.w500,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Text(
                                            "kcal",
                                            style: interFont(
                                              20,
                                              white,
                                              FontStyle.normal,
                                              FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final can = await Haptics.canVibrate();
                                      if (calorie != 0 || calorie != null) {
                                        await loadGoal();
                                        Navigator.pop(context);
                                        if (!can) return;
                                        await Haptics.vibrate(
                                          HapticsType.success,
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 77,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: signatureColor,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Save",
                                          style: interFont(
                                            18,
                                            Colors.black,
                                            FontStyle.normal,
                                            FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      if (!can) return;
                      await Haptics.vibrate(HapticsType.success);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.all(20),
                      child: (calorie == null)
                          ? Text(
                              "Select a specific number",
                              style: interFont(
                                18,
                                inactiveColor,
                                FontStyle.normal,
                                FontWeight.normal,
                              ),
                            )
                          : Text(
                              "$calorie kcal",
                              style: interFont(
                                18,
                                white,
                                FontStyle.normal,
                                FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  (userGoal == null) ? Text("") : finalGoal(userGoal!, height),
                  SizedBox(height: 5),
                  Text(
                    errorString,
                    style: interFont(
                      16,
                      Colors.red,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
              InkWell(
                onTap: () async {
                  final can = await Haptics.canVibrate();
                  if (calorie != null && goal != null) {
                    setState(() {
                      widget.saveData["goal"]["name"] = userGoal!.name;
                      widget.saveData["goal"]["calorie"] = userGoal!.calorie;
                      widget.saveData["goal"]["carbs"] = userGoal!.carbs;
                      widget.saveData["goal"]["fat"] = userGoal!.fat;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterScreen(saveData: widget.saveData),
                      ),
                    );
                    if (!can) return;
                    await Haptics.vibrate(HapticsType.success);
                  } else {
                    setState(() {
                      errorString = "Please fill the information";
                    });
                    if (!can) return;
                    await Haptics.vibrate(HapticsType.error);
                  }
                },
                child: Container(
                  height: 77,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: interFont(
                        16,
                        white,
                        FontStyle.normal,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget finalGoal(Goal goal, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Carbs per day",
        style: interFont(22, white, FontStyle.normal, FontWeight.w500),
      ),
      SizedBox(height: 20),
      Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "${goal.carbs} gram",
          style: interFont(
            18,
            inactiveColor,
            FontStyle.normal,
            FontWeight.w500,
          ),
        ),
      ),
      SizedBox(height: 20),

      Text(
        "Protein per day",
        style: interFont(22, white, FontStyle.normal, FontWeight.w500),
      ),
      SizedBox(height: 20),
      Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "${goal.protein} gram",
          style: interFont(
            18,
            inactiveColor,
            FontStyle.normal,
            FontWeight.w500,
          ),
        ),
      ),
      SizedBox(height: 20),

      Text(
        "Fat per day",
        style: interFont(22, white, FontStyle.normal, FontWeight.w500),
      ),
      SizedBox(height: 20),
      Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "${goal.fat} gram",
          style: interFont(
            18,
            inactiveColor,
            FontStyle.normal,
            FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
