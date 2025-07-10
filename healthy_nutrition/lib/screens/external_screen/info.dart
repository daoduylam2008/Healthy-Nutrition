import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/main.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/screens/external_screen/edit_info.dart';
import 'package:healthy_nutrition/token.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:wheel_picker/wheel_picker.dart';
import 'package:material_dialogs/material_dialogs.dart';

// ignore: must_be_immutable
class InfoPage extends StatefulWidget {
  UserInfo info;
  InfoPage({super.key, required this.info});

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> with TickerProviderStateMixin {
  bool edit = false;
  var size, width, height;

  late TextEditingController heightController;
  late TextEditingController weightController;

  @override
  void initState() {
    heightController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
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
                    radius: 30,
                    child: BackButton(color: white),
                  ),
                  InkResponse(
                    onTap: () async {
                      final can = await Haptics.canVibrate();

                      setState(() {
                        edit = !edit;
                      });
                      if (!can) return;
                      await Haptics.vibrate(HapticsType.success);
                    },
                    child: CircleAvatar(
                      backgroundColor: (edit == true) ? white : boxColor,
                      radius: 30,
                      child: Icon(
                        Symbols.edit,
                        color: (edit == true) ? Colors.black : white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21),
              CircleAvatar(
                backgroundColor: boxColor,
                radius: 61,
                child: Icon(Icons.person, size: 50, color: white),
              ),
              SizedBox(height: 13),
              InkWell(
                highlightColor: (edit == true) ? null : Colors.transparent,
                splashColor: (edit == true) ? null : Colors.transparent,
                onTap: () async {
                  final can = await Haptics.canVibrate();
                  if (edit == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditInfoScreen(info: widget.info),
                      ),
                    );
                    if (!can) return;
                    await Haptics.vibrate(HapticsType.success);
                  } else {
                    return;
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: (edit == true) ? inactiveColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 200,
                  child: Row(
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
                ),
              ),
              SizedBox(height: 38),
              userMeasurement(),
              SizedBox(height: 20),

              SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  await writeToken("");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainApp(),
                      maintainState: false,
                    ),
                  );
                  Phoenix.rebirth(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(228, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.black, fontSize: 20),
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

  Widget userMeasurement() {
    return Container(
      padding: EdgeInsets.only(right: 30, left: 30),
      height: 116,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          measurementCustomText(
            "Height",
            widget.info.height[0],
            widget.info.height[1],
            width,
          ),
          verticalDivider(62),
          measurementCustomText(
            "Weight",
            widget.info.weight[0],
            widget.info.weight[1],
            width,
          ),
          verticalDivider(62),
          measurementCustomText("Age", widget.info.age, "", width),
        ],
      ),
    );
  }

  Widget measurementCustomText(
    String type,
    String data,
    String unit,
    double width,
  ) {
    return SizedBox(
      width: width * 0.21,
      height: double.infinity,
      child: Column(
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
          InkWell(
            highlightColor: (edit == true) ? null : Colors.transparent,
            splashColor: (edit == true) ? null : Colors.transparent,
            onTap: () async {
              final can = await Haptics.canVibrate();

              if (edit == true) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,
                  backgroundColor: boxColor,
                  context: context,
                  builder: (context) {
                    if (type == "Height") {
                      return heightEdit(
                        widget.info,
                        height,
                        context,
                        this,
                        heightController,
                      );
                    } else if (type == "Weight") {
                      return weightEdit(
                        widget.info,
                        height,
                        context,
                        this,
                        weightController,
                      );
                    }
                    return ageEdit(widget.info, height, context);
                  },
                );
                if (!can) return;
                await Haptics.vibrate(HapticsType.success);
              } else {
                return;
              }
            },
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: (edit == true) ? inactiveColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data,
                    style: interFont(
                      26,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 3),
                  Column(
                    children: [
                      Text(
                        unit,
                        style: interFont(
                          18,
                          white,
                          FontStyle.normal,
                          FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget verticalDivider(double height) {
    return Container(
      height: height,
      width: 4,
      decoration: BoxDecoration(
        color: inactiveColor,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

void _showSaveMessage(BuildContext context, Function action) {
  Dialogs.materialDialog(
    titleStyle: interFont(20, white, FontStyle.normal, FontWeight.bold),
    msgStyle: interFont(16, white, FontStyle.normal, FontWeight.normal),
    context: context,
    color: boxColor,
    title: "Save",
    msg: "Are you sure to make this change?",
    actionsBuilder: (context) {
      return [
        IconsOutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'Cancel',
          iconData: Icons.cancel_outlined,
          textStyle: TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: () async {
            Navigator.pop(context);
            final can = await Haptics.canVibrate();

            action();
            if (!can) return;
            await Haptics.vibrate(HapticsType.success);
          },
          text: 'Save',
          iconData: Icons.check,
          color: signatureColor,
          textStyle: TextStyle(color: Colors.black),
          iconColor: Colors.black,
        ),
      ];
    },
  );
}

Widget heightEdit(
  UserInfo info,
  double height,
  BuildContext context,
  TickerProvider vsync,
  TextEditingController heightController,
) {
  return SingleChildScrollView(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: height * 0.4,
      child: Column(
        children: [
          Text(
            "Height",
            style: interFont(32, white, FontStyle.normal, FontWeight.w500),
          ),
          SizedBox(height: 40),
        ],
      ),
    ),
  );
}

Widget weightEdit(
  UserInfo info,
  double height,
  BuildContext context,
  TickerProvider vsync,
  TextEditingController weightController,
) {
  String weightUnit = "";
  List unit = ["kg", "pound"];

  return SingleChildScrollView(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: height * 0.4,
      child: Column(
        children: [
          Text(
            "Weight",
            style: interFont(32, white, FontStyle.normal, FontWeight.w500),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
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
                ),
                Flexible(
                  child: WheelPicker(
                    selectedIndexColor: white,
                    looping: false,
                    onIndexChanged: (index, interactionType) async {
                      final can = await Haptics.canVibrate();

                      if (!can) return;
                      await Haptics.vibrate(HapticsType.light);
                    },
                    initialIndex: 1,
                    itemCount: 2,
                    style: WheelPickerStyle(itemExtent: 30),
                    builder: (context, index) {
                      return Text(
                        "${unit[index]}",
                        style: interFont(
                          20,
                          inactiveColor,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ageEdit(UserInfo info, double height, BuildContext context) {
  int age = int.parse(info.age) - 1;

  return SingleChildScrollView(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: height * 0.4,
      child: Column(
        children: [
          Text(
            "Age",
            style: interFont(32, white, FontStyle.normal, FontWeight.w500),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: WheelPicker(
                    onIndexChanged: (index, interactionType) async {
                      final can = await Haptics.canVibrate();

                      age = index + 1;
                      print(age);

                      if (!can) return;
                      await Haptics.vibrate(HapticsType.light);
                    },
                    initialIndex: age,
                    itemCount: 129,
                    style: WheelPickerStyle(itemExtent: 30),
                    builder: (context, index) {
                      return Text(
                        "${index + 1}",
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
                  flex: 4,
                  child: Text(
                    "years",
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
          SizedBox(height: 60),
          InkWell(
            onTap: () async {
              final can = await Haptics.canVibrate();

              _showSaveMessage(context, () async {
                updateAge(age);
              });
              Navigator.pop(context);
              if (!can) return;
              await Haptics.vibrate(HapticsType.success);
            },
            child: Container(
              height: 77,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (age != int.parse(info.age))
                    ? signatureColor
                    : inactiveColor,
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
  );
}
