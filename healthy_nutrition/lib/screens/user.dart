import 'package:flutter/material.dart';

import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/screens/analysis.dart';
import 'package:healthy_nutrition/screens/favorite.dart';
import 'package:healthy_nutrition/screens/history.dart';
import 'package:healthy_nutrition/screens/home.dart';
import 'package:healthy_nutrition/screens/scanner.dart';

import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

int currentIndex = 0;
int previousIndex = 0;

final List<Widget> screens = [
  HomeScreen(),
  FavoriteScreen(),
  ScannerScreen(),
  AnalysisScreen(),
  HistoryScreen(),
];

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        navBarHeight: kBottomNavigationBarHeight + 5,
        backgroundColor: tabBarColor,
        screens: screens,
        navBarStyle: NavBarStyle.style3,
        items: [
          PersistentBottomNavBarItem(
            title: "home",
            iconSize: 35,
            icon: Icon(Icons.home),
            activeColorPrimary: white,
            inactiveColorPrimary: inactiveColor,
          ),
          PersistentBottomNavBarItem(
            title: "favorite",
            icon: Icon(Symbols.favorite),
            activeColorPrimary: white,
            inactiveColorPrimary: inactiveColor,
          ),
          PersistentBottomNavBarItem(
            title: "scan",
            icon: Icon(Symbols.center_focus_strong),
            activeColorPrimary: white,
            inactiveColorPrimary: inactiveColor,
          ),
          PersistentBottomNavBarItem(
            title: "analysis",
            icon: Icon(Symbols.diagnosis),
            activeColorPrimary: white,
            inactiveColorPrimary: inactiveColor,
          ),
          PersistentBottomNavBarItem(
            title: "history",
            icon: Icon(Symbols.history_edu),
            activeColorPrimary: white,
            inactiveColorPrimary: inactiveColor,
          ),
        ],
      ),
      backgroundColor: backgroundColor,
     );
  }
}
