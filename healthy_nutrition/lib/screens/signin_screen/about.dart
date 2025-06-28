import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/screens/signin_screen/goal.dart';
import 'package:healthy_nutrition/widgets/processWidget.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  var size, height, width;
  Map<String, dynamic> saveData = {
    "first_name": "",
    "last_name": "",
    "gender": "",
    "height": [],
    "weight": [],
    "goal": {},
  };

  late TextEditingController lastNameController;
  late TextEditingController firstNameController;
  late TextEditingController ageController;
  late TextEditingController heightController;
  late TextEditingController weightController;

  String? genderValue;
  String errorText = "";

  @override
  void initState() {
    lastNameController = TextEditingController();
    firstNameController = TextEditingController();
    ageController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    lastNameController.dispose();
    firstNameController.dispose();
    ageController.dispose();
    heightController.dispose(); 
    weightController.dispose();
    
    super.dispose();
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
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: boxColor,
                        radius: 30,
                        child: BackButton(color: white),
                      ),
                      SizedBox(width: width * 0.04),
                      processWidget(1),
                    ],
                  ),
                  SizedBox(height: 18),
                  Text(
                    "About you",
                    style: interFont(
                      32,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 44),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: TextField(
                        cursorColor: white,
                        controller: firstNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "First name",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: TextField(
                        cursorColor: white,
                        controller: lastNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Last name",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 44),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    height: height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(width: 27),
                                Text(
                                  "Sex",
                                  style: interFont(
                                    16,
                                    white,
                                    FontStyle.normal,
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            DropdownButtonHideUnderline(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 100,
                                height: 50,
                                child: DropdownButton<String>(
                                  value: genderValue,
                                  isDense: true,
                                  dropdownColor: boxColor,
                                  borderRadius: BorderRadius.circular(12),
                                  items: <String>["male", "female"].map((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
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
                                  onChanged: (value) {
                                    setState(() {
                                      genderValue = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(width: 27),
                                Text(
                                  "Age",
                                  style: interFont(
                                    16,
                                    white,
                                    FontStyle.normal,
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 100,
                              height: 50,
                              child: TextField(
                                cursorColor: white,
                                controller: ageController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Your age",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(width: 27),
                                Text(
                                  "Height (cm)",
                                  style: interFont(
                                    16,
                                    white,
                                    FontStyle.normal,
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 100,
                              height: 50,
                              child: TextField(
                                cursorColor: white,
                                controller: heightController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Your height",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(width: 27),
                                Text(
                                  "Weight (kg)",
                                  style: interFont(
                                    16,
                                    white,
                                    FontStyle.normal,
                                    FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 100,
                              height: 50,
                              child: TextField(
                                cursorColor: white,
                                controller: weightController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Your weight",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    errorText,
                    style: interFont(
                      16,
                      Colors.red,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  final can = await Haptics.canVibrate();
                  if (heightController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      firstNameController.text.isEmpty ||
                      weightController.text.isEmpty ||
                      ageController.text.isEmpty) {
                    setState(() {
                      errorText = "Please fill the information about you";
                    });
                    if (!can) return;
                    await Haptics.vibrate(HapticsType.error);
                  } else {
                    setState(() {
                      errorText = "";
                      saveData["first_name"] = firstNameController.text;
                      saveData["last_name"] = lastNameController.text;
                      saveData["gender"] = genderValue ?? "male";
                      saveData["height"] = [heightController.text, "cm"];
                      saveData["age"] = ageController.text;
                      saveData["weight"] = [weightController.text, "kg"];
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalScreen(saveData: saveData),
                      ),
                    );
                    if (!can) return;
                    await Haptics.vibrate(HapticsType.success);
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
