import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/screens/profile.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final int _currentIndex = 0;
  final List<Widget> _screens = [
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.center_focus_strong), label: ""),
              BottomNavigationBarItem(icon: Icon(Symbols.diagnosis), label: "")
            ]
          ),
        backgroundColor: backgroundColor,
        body: _screens[_currentIndex],
      ),
    );
  }
}
