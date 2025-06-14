import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';

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
  }
  return null;
}

Future<UserInfo?> fetchUserInfo() async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
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
  }
  return null;
}

Future<List<Food>?> fetchCategory(String category) async {
  final response = await http.post(
    Uri.parse("$url/get_category"),
    body: jsonEncode({"category": category}),
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    List<Food> d = [];
    List<Map<String, dynamic>> data = jsonDecode(response.body)["data"];

    for (int i = 0; i < data.length; i++) {
      d.add(Food.fromJson(data[i]));
    }

    return d;
  }

  return null;
}

Future<List<Food>?> fetchFoods(List foods) async {
  final response = await http.post(
    Uri.parse("$url/get_foods"),
    body: jsonEncode({"foods": foods}),
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body)["data"];
    List<Food> d = [];

    for (int i = 0; i < data.length; i++) {
      d.add(Food.fromJson(data[i]));
    }

    return d;
  }

  return null;
}

Future<List<Food>?> fetchDescription(String description) async {
  final response = await http.post(
    Uri.parse("$url/get_description"),
    body: jsonEncode({"description": description}),
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    List results = jsonDecode(response.body)["data"];
    List<Food> data = [];
    for (final r in results) {
      data.add(Food.fromJson(r));
    }

    return data;
  }

  return null;
}

Future<void> updateAge(int age) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({"username": username, "query": "age", "data": "$age"}),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change age");
  }
}

Future<void> updateHeight(double height, String unit) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({"username": username, "query": "height", "data": ["$height", unit]}),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change height");
  }
}

Future<void> updateWeight(double weight, String unit) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({"username": username, "query": "weight", "data": ["$weight", unit]}),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change weight");
  }
}

Future<void> updateLastName(String lastName) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({
      "username": username,
      "query": "last_name",
      "data": lastName,
    }),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change last name");
  }
}

Future<void> updateFirstName(String firstName) async {
  final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({
      "username": username,
      "query": "first_name",
      "data": firstName,
    }),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  if (response.statusCode == 200) {
    print("Successfully change first name");
  }
}

Future<void> updateGender(String gender) async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
  final SharedPreferences prefs = await prefs0;
  String token = prefs.getString("token") ?? "";

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({
      "username": username,
      "query": "gender",
      "data": gender,
    }),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    print("Successfully change gender");
  }
}