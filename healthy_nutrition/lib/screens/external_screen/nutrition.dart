import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/vitaminContainer.dart';

// ignore: must_be_immutable
class NutritionScreen extends StatefulWidget {
  Food food;
  bool favorite;
  int portion;
  int amount;
  NutritionScreen({
    super.key,
    required this.food,
    required this.favorite,
    required this.portion,
    required this.amount,
  });

  @override
  State<NutritionScreen> createState() => _NutritionScreen();
}

class _NutritionScreen extends State<NutritionScreen> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    Map<String, dynamic> nutrition = nutritionCalculator([
      widget.food,
    ], [widget.portion], [widget.amount]);

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: boxColor,
                    child: BackButton(color: white),
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: Center(
                      child: Text(
                        widget.food.description,
                        style: interFont(
                          32,
                          white,
                          FontStyle.normal,
                          FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  CircleAvatar(radius: 30, backgroundColor: boxColor),
                ],
              ),
              SizedBox(height: 31),
              Container(
                height: 77,
                width: 233,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(height: 31),
              Text(
                "Category",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Vitamin",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              vitaminContainer(nutrition, context)
            ],
          ),
        ),
      ),
    );
  }
}
