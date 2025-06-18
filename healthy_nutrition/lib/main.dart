import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/screens/start.dart';
import 'package:healthy_nutrition/screens/user.dart';
import 'package:healthy_nutrition/screens/login.dart';
import 'package:healthy_nutrition/token.dart';

import 'package:shared_preferences/shared_preferences.dart';

List<CameraDescription> cameras = <CameraDescription>[];


void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}


Future<void> main() async{
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    _logError(e.code, e.description);
  }

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainApp();
}

// ignore: must_be_immutable
class _MainApp extends State<MainApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> token;

  @override
  void initState() {
    super.initState();
    // Create SharedPreference value, particularly token
    token = _prefs.then((pref) {
      return pref.getString('token') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String>(
        future: token,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                String t = snapshot.data!;
                if (t == "" || isExpired(t)) {
                  return StartScreen();
                }
                return UserScreen();
              }
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
