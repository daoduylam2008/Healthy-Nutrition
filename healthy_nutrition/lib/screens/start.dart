import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/screens/login.dart';
import 'package:healthy_nutrition/screens/signin_screen/about.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(right: 17, left: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Healthy Nutrition",
              style: interFont(32, white, FontStyle.normal, FontWeight.w500),
            ),
            SizedBox(height: 27),
            Image(
              height: height* 0.69,
              width: width * 0.9,
              image: AssetImage("assets/background.png"), fit: BoxFit.fill),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.43,
                    height: 77,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(26)
                    ),
                    child: Center(child: Text("Login", style: interFont(16, white, FontStyle.normal, FontWeight.w500),)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: width * 0.43,
                    height: 77,
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(26)
                    ),
                    child: Center(child: Text("Get start", style: interFont(16, white, FontStyle.normal, FontWeight.w500),)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
