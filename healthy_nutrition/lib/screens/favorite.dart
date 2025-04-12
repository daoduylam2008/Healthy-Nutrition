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
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Image(
                    image: AssetImage("assets/icons/$name.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "We have not collected enough information and data about $name!",
                    style: latoFont(
                      20,
                      foregroundColor,
                      FontStyle.normal,
                      FontWeight.normal,
                    ),
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
                height: 500,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(15),
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
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MultiCircularSlider(
                          trackWidth: 8,
                          values: [dataMap["Protein"]! / total, dataMap["Carbs"]! / total, dataMap["Fat"]! / total],
                          colors: [Colors.red, Colors.green, Colors.blue],
                          size: 100,
                          progressBarType: MultiCircularSliderType.circular,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                        ],)
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
