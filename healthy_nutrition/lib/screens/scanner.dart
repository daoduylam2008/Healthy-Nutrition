import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/screens/external_screen/scanning_camera.dart';
import 'package:flutter/material.dart';
import 'package:healthy_nutrition/widgets/foodBox.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreen();
}

class _ScannerScreen extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserInfo info = snapshot.data!;
            var history = [];
            var descriptions = [];

            int index = 0;

            for (final i in info.history.keys.toList()) {
              if (index < 10) {
                history.addAll(info.history[i]);
              }
              index += 1;
            }

            for (final i in history) {
              descriptions.add(i["description"]);
            }
            if (index == 0) {
              return Center(
                child: Text(
                  "Your history is empty\nStart scanning now!!",
                  style: interFont(
                    16,
                    white,
                    FontStyle.normal,
                    FontWeight.normal,
                  ),
                ),
              );
            }
            return SafeArea(
              minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Scan",
                    style: interFont(
                      32,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 49),
                  InkWell(
                    borderRadius: BorderRadius.circular(38),
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScaningSreen(info: info)),
                      );
                      final can = await Haptics.canVibrate();

                      if (!can) return;
                      await Haptics.vibrate(HapticsType.success);
                    },
                    child: Container(
                      height: 131,
                      decoration: BoxDecoration(
                        color: signatureColor,
                        borderRadius: BorderRadius.circular(38),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            weight: 500,
                            Symbols.center_focus_strong,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Scan",
                            style: interFont(
                              20,
                              Colors.black,
                              FontStyle.normal,
                              FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Recent Scans",
                    style: interFont(
                      32,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 63),
                  FutureBuilder(
                    future: fetchFoods(descriptions),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: descriptions.length,
                            itemBuilder: (context, ind) {
                              return foodBox(
                                history[ind]["portion"],
                                null,
                                snapshot2.data![ind],
                                int.parse(history[ind]["amount"]),
                                info,
                                false,
                                context,
                              );
                            },
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
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
