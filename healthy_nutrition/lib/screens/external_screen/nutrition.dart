import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/factorsPieChart.dart';
import 'package:healthy_nutrition/widgets/mineralContainer.dart';
import 'package:healthy_nutrition/widgets/vitaminContainer.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

// ignore: must_be_immutable
class NutritionScreen extends StatefulWidget {
  Food food;
  int portion;
  int amount;
  UserInfo info;
  NutritionScreen({
    super.key,
    required this.food,
    required this.portion,
    required this.amount,
    required this.info,
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

    bool favorite = isFavorite(widget.info, widget.food);

    var portions = widget.food.portion;
    String portion = portions.keys.toList()[widget.portion];

    Map<String, dynamic> nutrition = nutritionCalculator(
      [widget.food],
      [widget.portion],
      [widget.amount],
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
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
                        widget.food.name,
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
                  InkWell(
                    onTap: () async {
                      final can = await Haptics.canVibrate();
                      List data = widget.info.favorite;
                      if (favorite == false) {
                        data.add({
                          "description": widget.food.description,
                          "category": widget.food.category,
                          "name": widget.food.name,
                          "portion": widget.portion,
                        });
                      } else {
                        print({
                          "category": widget.food.category,
                          "description": widget.food.description,
                          "name": widget.food.name,
                          "portion": widget.portion,
                        });

                        data.removeWhere(
                          (item) => item["name"] == widget.food.name,
                        );
                      }

                      print(data);
                      await updateFavoriteList(data);
                      setState(() {
                        favorite = !favorite;
                      });
                      if (!can) return;
                      await Haptics.vibrate(HapticsType.success);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: boxColor,
                      child: (favorite == true)
                          ? Icon(Icons.favorite, color: Colors.red, size: 30)
                          : Icon(Icons.favorite_border, size: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 31),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  left: 30,
                  right: 100,
                ),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      portion,
                      style: interFont(
                        16,
                        white,
                        FontStyle.normal,
                        FontWeight.w500,
                      ),
                    ),
                    Text(
                      "(${portions[portion].toString()}g)",
                      style: interFont(
                        16,
                        inactiveColor,
                        FontStyle.normal,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 31),
              Text(
                "Category",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: signatureColor,
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Text(
                  widget.food.category,
                  style: interFont(
                    14,
                    Colors.black,
                    FontStyle.normal,
                    FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 51),
              Text(
                "Description",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: signatureColor,
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Text(
                  widget.food.description,
                  style: interFont(
                    14,
                    Colors.black,
                    FontStyle.normal,
                    FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50),
              factorsPieChart(nutrition),
              SizedBox(height: 60),
              Text(
                "Vitamin",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              vitaminContainer(nutrition, context),
              SizedBox(height: 60),
              Text(
                "Mineral",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              mineralContainer(nutrition, context),
            ],
          ),
        ),
      ),
    );
  }
}
