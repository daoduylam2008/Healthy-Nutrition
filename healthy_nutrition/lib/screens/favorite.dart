import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/widgets/foodBox.dart';


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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Favorites",
                style: interFont(32, white, FontStyle.normal, FontWeight.bold),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: boxColor,
                child: Icon(Icons.add, size: 40),
              ),
            ],
          ),
          SizedBox(height: 30),
          FutureBuilder(
            future: fetchUserInfo(),
            builder: (context, snapshot1) {
              if (snapshot1.hasData) {
                List favorites = snapshot1.data!.favorite;
                List favoriteFoods = [];

                for (final f in favorites) {
                  favoriteFoods.add(f["name"]);
                }

                return FutureBuilder(
                  future: fetchFoods(favoriteFoods),
                  builder: (context, snapshot2) {
                    if (snapshot2.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: favoriteFoods.length,
                          itemBuilder: (context, index) {
                            Food food = snapshot2.data![index];
                            return foodBox(favorites[index]["name"], favorites[index]["portion"], true, food, context);
                          },
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
