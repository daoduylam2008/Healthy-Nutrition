import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/screens/external_screen/nutrition.dart';

Widget foodBox(int portion, bool favorite, Food food, int amount, context) {
  var size = MediaQuery.of(context).size;
  var width = size.width;

  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NutritionScreen(food: food, favorite: true, portion: portion, amount: amount,),
            ),
          );
        },
        child: Container(
          height: 120,
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
                    width: 110,
                    height: 110,
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
                      SizedBox(
                        width: width * 0.37,
                        child: Text(
                          food.description,
                          overflow: TextOverflow.ellipsis,
                          style: interFont(
                            18,
                            white,
                            FontStyle.normal,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        food.category,
                        style: interFont(
                          14,
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
      ),
      SizedBox(height: 18),
    ],
  );
}
