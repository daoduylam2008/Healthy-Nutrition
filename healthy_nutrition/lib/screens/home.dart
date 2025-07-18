import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/screens/external_screen/info.dart';
import 'package:healthy_nutrition/widgets/healthProfileContainer.dart';
import 'package:healthy_nutrition/widgets/historyNutritionView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var size, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    return SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: fetchUserInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserInfo info = snapshot.data!;

                bool empty = true;
                for (final i in info.history.keys.toList()) {
                  if (todayTest.dateToString() == i) {
                    empty = false;
                  }
                }

                if (info.history == {} || empty == true) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today",
                              style: interFont(
                                32,
                                white,
                                FontStyle.normal,
                                FontWeight.w600,
                              ),
                            ),
                            profileButton(info),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Your today history is empty!!",
                          style: interFont(
                            16,
                            white,
                            FontStyle.normal,
                            FontWeight.normal,
                          ),
                        ),
                        Text(
                          "Let's scan today!!",
                          style: interFont(
                            16,
                            white,
                            FontStyle.normal,
                            FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: interFont(
                              32,
                              white,
                              FontStyle.normal,
                              FontWeight.w600,
                            ),
                          ),
                          profileButton(info),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Click the below menu to see detail!",
                          style: interFont(
                            14,
                            inactiveColor,
                            FontStyle.normal,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      healthProfileContainer(info, false, width, todayTest, context),
                      SizedBox(height: 33),
                      Text(
                        "Food",
                        style: interFont(
                          32,
                          white,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                      ),
                      historyNutritionView(info, todayTest, width, null, false),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget profileButton(UserInfo info) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage(info: info)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: boxColor),
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 50,
              color: const Color.fromARGB(157, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
