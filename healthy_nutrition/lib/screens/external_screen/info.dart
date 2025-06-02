import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class InfoPage extends StatefulWidget {
  UserInfo info;
  InfoPage({super.key, required this.info});

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 60, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: boxColor,
                    radius: 40,
                    child: BackButton(
                      color: white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: boxColor,
                    radius: 40,
                    child: Icon(Symbols.edit),
                  ),
                ],
              ),
              SizedBox(height: 21),
              CircleAvatar(
                backgroundColor: boxColor,
                radius: 61,
                child: Icon(Icons.person, size: 50),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.info.firstName} ${widget.info.lastName}",
                    style: interFont(
                      24,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  (widget.info.gender == "male")
                      ? Icon(Icons.male, size: 40, color: maleColor)
                      : Icon(Icons.female, size: 40, color: femaleColor),
                ],
              ),
              SizedBox(height: 38),
              userMeasurement(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userMeasurement() {
    return Container(
      padding: EdgeInsets.only(
        right: 30,
        left: 30
      ),
      height: 116,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          measurementCustomText("Height", widget.info.height, "m"),
          verticalDivider(62),
          measurementCustomText("Weight", widget.info.weight, "kg"),
          verticalDivider(62),          
          measurementCustomText("Age", widget.info.age, "")
          ],
      ),
    );
  }

  Widget measurementCustomText(String type, String data, String unit) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type,
          style: interFont(
            18,
            inactiveColor,
            FontStyle.normal,
            FontWeight.normal,
          ),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              data,
              style: interFont(26, white, FontStyle.normal, FontWeight.w500),
            ),
            SizedBox(width: 3,),
            Text(
              unit,
              style: interFont(18, white, FontStyle.normal, FontWeight.normal),
            )
          ],
        ),
      ],
    );
  }

  Widget verticalDivider(double height) {
    return Container(
      height: height,
      width: 4,
      decoration: BoxDecoration(
        color: inactiveColor,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}
