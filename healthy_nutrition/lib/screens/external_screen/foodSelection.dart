import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/factorsPieChart.dart';
import 'package:healthy_nutrition/widgets/mineralContainer.dart';
import 'package:healthy_nutrition/widgets/vitaminContainer.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:healthy_nutrition/request.dart';

// ignore: must_be_immutable
class FoodSelectionScreen extends StatefulWidget {
  Food food;
  UserInfo info;
  FoodSelectionScreen({super.key, required this.food, required this.info});

  @override
  State<FoodSelectionScreen> createState() => _FoodSelectionScreen();
}

class _FoodSelectionScreen extends State<FoodSelectionScreen> {
  var size, width, height;
  String? p;
  int portion = -1;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    List<String> portions = widget.food.portion.keys.toList();
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    bool favorite = isFavorite(widget.info, widget.food);

    Map<String, dynamic> nutrition = nutritionCalculator(
      [widget.food],
      [portion],
      [amount],
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: signatureColor,
        child: Icon(Icons.add, color: Colors.black, size: 30),
      ),
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
                          "portion": portion,
                        });
                      } else {
                        print({
                          "category": widget.food.category,
                          "description": widget.food.description,
                          "name": widget.food.name,
                          "portion": portion,
                        });

                        data.removeWhere(
                          (item) => item["name"] == widget.food.name,
                        );
                      }

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
              DropdownButtonHideUnderline(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: p,
                        hint: Text(
                          "Choose your portion",
                          style: interFont(
                            16,
                            white,
                            FontStyle.normal,
                            FontWeight.w500,
                          ),
                        ),
                        isDense: true,
                        dropdownColor: boxColor,
                        borderRadius: BorderRadius.circular(12),
                        items: portions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: interFont(
                                16,
                                white,
                                FontStyle.normal,
                                FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            setState(() {
                              p = value;      
                              portion = widget.food.portion.keys.toList().indexOf(p!);                        
                            });
                          });
                        },
                      ),
                      (p == null)
                          ? Text(
                              "No portion",
                              style: interFont(
                                16,
                                inactiveColor,
                                FontStyle.normal,
                                FontWeight.normal,
                              ),
                            )
                          : Text(
                              "${widget.food.portion[p]}gram",
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
              vitaminContainer(nutrition),
              SizedBox(height: 60),
              Text(
                "Mineral",
                style: interFont(24, white, FontStyle.normal, FontWeight.w500),
              ),
              SizedBox(height: 26),
              mineralContainer(nutrition),
            ],
          ),
        ),
      ),
    );
  }
}
