import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/file_manager.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
      child: FutureBuilder(
        future: fetchUserInfo(),
        builder: (context, snapshot1) {
          return FutureBuilder(
            future: loadJsonFromAssets("assets/food_data.json"),
            builder: (context, snapshot2) {
              if (snapshot1.hasData && snapshot2.hasData) {
                UserInfo info = snapshot1.data!;
                Map<String, dynamic> data = snapshot2.data!;
                if (info.favorite.isEmpty) {
                  return Center(child: Column(children: []));
                }
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Favorite",
                        style: nunitoFont(
                          50,
                          foregroundColor,
                          FontStyle.normal,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(info.favorite.length, (index) {
                          return card(info.favorite[index], data);
                        }),
                      ),
                    ),
                  ],
                );
              }
              return Center(child: const CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget card(String name, Map<String, dynamic> data) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodInformation(name: name, data: data),
          ),
        );
      },
      child: Card(
        color: boxColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/icons/$name.png")),
            Text(
              name,
              style: nunitoFont(
                25,
                foregroundColor,
                FontStyle.normal,
                FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodInformation extends StatelessWidget {
  final String name;
  final Map<String, dynamic> data;

  const FoodInformation({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data[name] == null) {
      return Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(top: 60, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.topLeft, child: BackButton()),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: Image(
                          image: AssetImage("assets/icons/$name.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "We have not collected enough information and data about $name!",
                        style: latoFont(
                          20,
                          foregroundColor,
                          FontStyle.normal,
                          FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    Map<String, double> dataMap = {
      "Calories": double.parse(data[name]["Calories"]),
      "Protein": double.parse(data[name]["Protein"]),
      "Carbs": double.parse(data[name]["Carbs"]),
      "Fat": double.parse(data[name]["Fat"]),
    };
    double total = dataMap["Protein"]! + dataMap["Carbs"]! + dataMap["Fat"]!;

    Widget infoText(String text, bool blur) {
      if (blur) {
        return Text(text, style: latoFont(20, blurTextColor, FontStyle.normal, FontWeight.normal),);
      }
      return Text(text, style: latoFont(20, foregroundColor, FontStyle.normal, FontWeight.bold),);
    }

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 60, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.topLeft, child: BackButton()),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 1000,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    // Image and name of food section
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: Image(
                        image: AssetImage("assets/icons/$name.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      name.capitalize(),
                      style: latoFont(
                        25,
                        foregroundColor,
                        FontStyle.normal,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    // Calories section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: MultiCircularSlider(
                            showTotalPercentage: false,
                            innerWidget: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${dataMap["Calories"]}",
                                  style: latoFont(
                                    25,
                                    foregroundColor,
                                    FontStyle.normal,
                                    FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  "Calories",
                                  style: latoFont(
                                    15,
                                    blurTextColor,
                                    FontStyle.normal,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trackWidth: 8,
                            values: [
                              dataMap["Protein"]! / total,
                              dataMap["Carbs"]! / total,
                              dataMap["Fat"]! / total,
                            ],
                            colors: [Colors.red, Colors.orange, Colors.blue],
                            size: 150,
                            progressBarType: MultiCircularSliderType.circular,
                          ),
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle, color: Colors.red),
                                SizedBox(width: 5),
                                Text(
                                  "Protein",
                                  style: latoFont(
                                    20,
                                    blurTextColor,
                                    FontStyle.normal,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.circle, color: Colors.orange),
                                SizedBox(width: 5),
                                Text(
                                  "Carbs",
                                  style: latoFont(
                                    20,
                                    blurTextColor,
                                    FontStyle.normal,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.circle, color: Colors.blue),
                                SizedBox(width: 5),
                                Text(
                                  "Fat",
                                  style: latoFont(
                                    20,
                                    blurTextColor,
                                    FontStyle.normal,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    // More information and data
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          infoText("Measure", true),
                          infoText("Grams", true),
                          infoText("Calories", true),
                          infoText("Protein", true),
                          infoText("Fat", true),
                          infoText("Sat.Fat", true),
                          infoText("Fiber", true),
                          infoText("Carbs", true),
                          ]
                        ),
                        Column(
                        spacing: 10,
                        children: [
                          infoText(data[name]["Measure"], false),
                          infoText(data[name]["Grams"], false),
                          infoText(data[name]["Calories"], false),
                          infoText(data[name]["Protein"], false),
                          infoText(data[name]["Fat"], false),
                          infoText(data[name]["Sat.Fat"], false),
                          infoText(data[name]["Fiber"], false),
                          infoText(data[name]["Carbs"], false),                          ]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
