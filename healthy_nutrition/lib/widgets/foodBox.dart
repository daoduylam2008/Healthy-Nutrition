import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/screens/external_screen/foodSelection.dart';
import 'package:healthy_nutrition/screens/external_screen/nutrition.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:pie_chart/pie_chart.dart';

Widget foodBox(
  int? portion,
  double? percent,
  Food food,
  int? amount,
  UserInfo info,
  context,
) {
  var size = MediaQuery.of(context).size;
  var width = size.width;
  bool favorite = isFavorite(info, food);
  Color color;
  if (percent == null) {
    color = Colors.transparent;
  } else if (percent >= 80) {
    color = Colors.green;
  } else if (percent >= 50) {
    color = Colors.orange;
  } else {
    color = Colors.red;
  }
  return Column(
    children: [
      InkWell(
        onTap: () {
          if (portion == null && amount == null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FoodSelectionScreen(food: food, info: info),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NutritionScreen(
                  food: food,
                  portion: portion!,
                  amount: amount!,
                  info: info,
                ),
              ),
            );
          }
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
                    padding: EdgeInsets.all(8),
                    child: Image.network(food.imageURL, scale: 1),
                  ),
                  SizedBox(width: 13),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (percent == null) ? SizedBox() :CircleAvatar(radius: 20, backgroundColor: color, child: Text("${percent.roundNum(1)}", style: interFont(15, white, FontStyle.normal, FontWeight.w500),),),
                      SizedBox(
                        width: width * 0.37,
                        child: Text(
                          food.name,
                          overflow: TextOverflow.ellipsis,
                          style: interFont(
                            18,
                            white,
                            FontStyle.normal,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: Text(
                          food.category,
                          overflow: TextOverflow.ellipsis,
                          style: interFont(
                            14,
                            inactiveColor,
                            FontStyle.normal,
                            FontWeight.normal,
                          ),
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
