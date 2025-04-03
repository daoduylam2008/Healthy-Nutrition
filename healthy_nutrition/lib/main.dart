import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/screens/analysis.dart';
import 'package:healthy_nutrition/screens/favourite.dart';
import 'package:healthy_nutrition/screens/history.dart';
import 'package:healthy_nutrition/screens/profile.dart';
import 'package:healthy_nutrition/screens/scanner.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:camera/camera.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

late List<CameraDescription> cameras;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ProfileScreen(),
    FavouriteScreen(),
    ScannerScreen(),
    AnalysisScreen(),
    HistoryScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: PersistentTabView(
          context,
          navBarHeight: kBottomNavigationBarHeight + 5,
          backgroundColor: tabBarColor,
          screens: _screens,
          navBarStyle: NavBarStyle.style15,
          items: [
            PersistentBottomNavBarItem(
              title: "profile",
              iconSize: 35,
              icon: Icon(Icons.person),
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
              icon: Icon(
                Symbols.center_focus_strong,
                color: Colors.black,
                ),
              activeColorPrimary: white,
              inactiveColorSecondary: inactiveColor,
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
              )
          ],
          onItemSelected: (value) => _currentIndex = value,
        ),
        backgroundColor: backgroundColor,
        body: _screens[_currentIndex],
      ),
    );
  }
}
