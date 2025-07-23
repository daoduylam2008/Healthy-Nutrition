import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/widgets/foodBox.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

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
              CircleAvatar(radius: 35, backgroundColor: Colors.transparent),
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
                  favoriteFoods.add(f["description"]);
                }

                if (favoriteFoods.isEmpty) {
                  return Text(
                    "Your favorite list is empty",
                    style: interFont(
                      16,
                      white,
                      FontStyle.normal,
                      FontWeight.normal,
                    ),
                  );
                }

                return FutureBuilder(
                  future: fetchFoods(favoriteFoods),
                  builder: (context, snapshot2) {
                    if (snapshot2.hasData) {
                      try {
                        return Expanded(
                          child: RefreshIndicator(
                            color: signatureColor,
                            elevation: 1,
                            displacement: 85,
                            onRefresh: () async {
                              final can = await Haptics.canVibrate();
                              List _favorite = [];
                              _favorite = (await fetchUserInfo())!.favorite;

                              setState(() {
                                favorites = _favorite;
                              });
                              if (!can) return;
                              await Haptics.vibrate(HapticsType.success);
                            },
                            child: ListView.builder(
                              itemCount: favorites.length,
                              itemBuilder: (context, index) {
                                try {
                                  Food food = snapshot2.data![index];
                                  return foodBox(
                                    favorites[index]["portion"],
                                    null,
                                    food,
                                    1,
                                    snapshot1.data!,
                                    false,
                                    context,
                                  );
                                } catch (e) {
                                  return Center(child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        );
                      } catch (e) {
                    return Center(child: CircularProgressIndicator());
                      }
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
