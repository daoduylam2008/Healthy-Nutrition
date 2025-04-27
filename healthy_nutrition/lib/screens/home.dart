import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/screens/info.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
      child: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserInfo info = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  profileButton(info),
                  SizedBox(height: 10),
                  healthProfileContainer(info),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget profileButton(UserInfo info) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(info: info,)));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle, color: boxColor),
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: 40,
                color: const Color.fromARGB(157, 255, 255, 255),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget healthProfileContainer(UserInfo info) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  size: 50,
                  Symbols.favorite,
                  fill: 1,
                  color: Colors.pinkAccent,
                ),
                SizedBox(width: 7),
                Text(
                  "Today",
                  style: latoFont(
                    45,
                    textColor,
                    FontStyle.normal,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
