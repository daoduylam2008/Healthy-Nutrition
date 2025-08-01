import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/main.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/token.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
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
    var log = await login(username.text, password.text);

    if (log == null) {
      setState(() {
        visible = true;
      });
    } else {
      await writeToken(log);
      setState(() {
        visible = false;
        token = readToken();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainApp()),
        );
        Phoenix.rebirth(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        minimum: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: boxColor,
                  radius: 30,
                  child: BackButton(color: white),
                ),
                Text(
                  "Login",
                  style: interFont(
                    32,
                    white,
                    FontStyle.normal,
                    FontWeight.w500,
                  ),
                ),
                CircleAvatar(backgroundColor: Colors.transparent, radius: 30),
              ],
            ),
            SizedBox(height: 28),
            // Username Field
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                    hintText: "username/email",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            // Password field
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                      child: (showPassword)
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
              padding: EdgeInsetsGeometry.only(top: 50, bottom: 20),
              child: InkWell(
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
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
