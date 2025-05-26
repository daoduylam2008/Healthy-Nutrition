import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/screens/external_screen/nutrition.dart';

Widget foodBox(String name, int portion, bool favorite, Food food, context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NutritionScreen(food: food, favorite: true)));
    },
    child: Container(
      height: 131,
      padding: EdgeInsets.only(top: 4, left: 4, bottom: 4, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: boxColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(34),
                ),
              ),
              SizedBox(width: 13),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: interFont(
                      20,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                  Text(
                    food.category,
                    style: interFont(
                      16,
                      inactiveColor,
                      FontStyle.normal,
                      FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              (favorite == true)
                  ? Icon(Icons.favorite, color: Colors.red, size: 30)
                  : Icon(Icons.favorite_border, size: 30),
              SizedBox(width: 5),
              Icon(Icons.chevron_right, size: 30),
            ],
          ),
        ],
      ),
    ),
  );
}
