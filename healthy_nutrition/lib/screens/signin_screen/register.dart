import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/main.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/token.dart';
import 'package:healthy_nutrition/widgets/processWidget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  Map<String, dynamic> saveData;
  RegisterScreen({super.key, required this.saveData});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  var size, height, width;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool showPassword = false;

  String errorString = "";

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(right: 30, left: 30, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: boxColor,
                      radius: 30,
                      child: BackButton(color: white),
                    ),
                    SizedBox(width: width * 0.04),
                    processWidget(3),
                  ],
                ),
                SizedBox(height: 18),
                Center(
                  child: Text(
                    "Register to start",
                    style: interFont(
                      32,
                      white,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 44),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: TextField(
                      cursorColor: white,
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "username",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: TextField(
                      cursorColor: white,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "email",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: TextField(
                      obscureText: !showPassword,
                      cursorColor: white,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "password",
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
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  errorString,
                  style: interFont(
                    16,
                    Colors.red,
                    FontStyle.normal,
                    FontWeight.w500,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                if (passwordController.text.isEmpty ||
                    usernameController.text.isEmpty ||
                    emailController.text.isEmpty) {
                  setState(() {
                    errorString = "Please fill the information";
                  });
                } else {
                  print(widget.saveData);
                  var token = await register(
                    usernameController.text,
                    passwordController.text,
                    emailController.text,
                    widget.saveData,
                  );
                  if (token != null) {
                    await writeToken(token);
                    setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainApp()),
                    );
                    Phoenix.rebirth(context);
                  } else {
                    setState(() {
                      errorString = "This username or this email was taken";
                    });
                  }
                }
              },
              child: Container(
                height: 77,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: signatureColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: interFont(
                      16,
                      Colors.black,
                      FontStyle.normal,
                      FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
