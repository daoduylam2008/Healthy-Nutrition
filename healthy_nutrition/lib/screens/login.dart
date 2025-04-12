import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/screens/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  late Future<String> token;

  bool showPassword = false;
  bool visible = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> logIn() async {
    final SharedPreferences prefs = await _prefs;

    var log = await login(username.text, password.text);

    if (log == null) {
      setState(() {
        visible = true;
      });
    } else {
      setState(() {
        visible = false;
        token = prefs.setString('token', log).then((bool success) {
          return token;
        });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserScreen()),
      );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Username Field
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: tabBarColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: username,
                  cursorColor: white,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            // Password field
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: tabBarColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: TextField(
                  obscureText: !showPassword,
                  controller: password,
                  cursorColor: white,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child:
                          (showPassword)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // Login Button
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: 50,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: GestureDetector(
                onTap: logIn,
                child: Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(228, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),

            Visibility(
              visible: visible,
              child: Text(
                "Your email or password is wrong",
                style: TextStyle(fontSize: 25, color: Colors.red, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
