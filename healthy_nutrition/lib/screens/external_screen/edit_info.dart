import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';


// ignore: must_be_immutable
class EditInfoScreen extends StatefulWidget {
  UserInfo info;
  EditInfoScreen({super.key, required this.info});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreen();
}

class _EditInfoScreen extends State<EditInfoScreen> {
  late TextEditingController lastNameController;
  late TextEditingController firstNameController;
  String? genderValue;

  @override
  void initState() {
    genderValue = widget.info.gender;

    lastNameController = TextEditingController();
    firstNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 60, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: boxColor,
                radius: 30,
                child: BackButton(color: white),
              ),
              SizedBox(height: 50),
              Text(
                "First Name",
                style: interFont(16, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 5),
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
                    controller: firstNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.info.firstName,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Last Name",
                style: interFont(16, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 5),
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
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.info.lastName,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Gender",
                    style: interFont(
                      16,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButtonHideUnderline(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 100,
                      height: 50,
                      child: DropdownButton<String>(
                        value: genderValue,
                        isDense: true,
                        dropdownColor: boxColor,
                        borderRadius: BorderRadius.circular(12),
                        items: <String>["male", "female"].map((String value) {
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
              SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  final can = await Haptics.canVibrate();

                  if (firstNameController.text != "" && firstNameController.text != widget.info.firstName) {
                    updateFirstName(firstNameController.text);
                  }

                  if (lastNameController.text != "" && lastNameController.text != widget.info.lastName) {
                    updateLastName(lastNameController.text);
                  }

                  if (genderValue != widget.info.gender) {
                    updateGender(genderValue!);
                  }
                  if (!can) return;
                  await Haptics.vibrate(HapticsType.success);
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
            ],
          ),
        ),
      ),
    );
  }
}
