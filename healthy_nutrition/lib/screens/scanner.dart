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
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Scan", style: interFont(32, white, FontStyle.normal, FontWeight.w500)),
            SizedBox(height: 49),
            InkResponse(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScaningSreen()),
                );
                final can = await Haptics.canVibrate();

                if (!can) return;
                await Haptics.vibrate(HapticsType.success);
              },
              child: Container(
                height: 131,
                decoration: BoxDecoration(
                  color: signatureColor,
                  borderRadius: BorderRadius.circular(38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Symbols.center_focus_strong, size: 25, color: Colors.black),
                    Text("Scan", style: interFont(20, Colors.black, FontStyle.normal, FontWeight.normal),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Text("Recent Scans", style: interFont(32, white, FontStyle.normal, FontWeight.w500)),
            SizedBox(height: 63),
            FutureBuilder(
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

                  return FutureBuilder(
                    future: fetchFoods(descriptions),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: descriptions.length,
                            itemBuilder: (context, ind) {
                                bool favorite = false;
                                for (final i in info.favorite) {
                                  if (i["description"] ==
                                      snapshot.data![ind].description) {
                                    favorite = true;
                                  }
                                }
                              return foodBox(
                                history[ind]["portion"],
                                favorite,
                                snapshot.data![ind],
                                int.parse(history[ind]["amount"]),
                                context,
                              );
                            },
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
