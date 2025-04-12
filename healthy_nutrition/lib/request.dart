import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> login(String username, String password) async {
  final response = await http.post(
    Uri.parse("$url/login"),
    body: jsonEncode({"username": username, "password": password}),
    headers: <String, String>{"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body)["Authorization"];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return null;
  }
}

Future<UserInfo?> fetchUserInfo() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/info"),
    body: jsonEncode({"username": username}),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    return UserInfo.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}

