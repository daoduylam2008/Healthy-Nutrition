import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/token.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'dart:async';
import 'dart:convert';

Future<String?> login(String username, String password) async {
  final response = await http.post(
    Uri.parse("$url/login"),
    body: jsonEncode({"username": username, "password": password}),
    headers: <String, String>{"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)["Authorization"];
  }
  return null;
}

Future<String?> register(
  String username,
  String password,
  String email,
  Map<String, dynamic> data,
) async {
  final response = await http.post(
    Uri.parse("$url/register"),
    body: jsonEncode({
      "username": username,
      "password": password,
      "email": email,
      "data": data,
    }),
    headers: <String, String>{"content-type": "application/json"},
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body)["Authorization"];
  }
  return null;
}

Future<UserInfo?> fetchUserInfo() async {
  String token = await readToken();

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

Future<List<Food>?> fetchNames(List names) async {
  final response = await http.post(
    Uri.parse("$url/get_names"),
    body: jsonEncode({"name": names}),
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    List<Food> d = [];

    var data = jsonDecode(response.body)["data"];
    for (final i in data) {
      d.add(Food.fromJson(i));
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
  String token = await readToken();

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
  String token = await readToken();

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({
      "username": username,
      "query": "height",
      "data": ["$height", unit],
    }),
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
  String token = await readToken();

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({
      "username": username,
      "query": "weight",
      "data": ["$weight", unit],
    }),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change weight");
  }
}

Future<void> updateFavoriteList(List data) async {
  String token = await readToken();

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({"username": username, "query": "favorite", "data": data}),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change favorite");
  }
}

Future<void> updateHistory(Map<String, dynamic> data) async {
  String token = await readToken();

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({"username": username, "query": "history", "data": data}),
    headers: {
      "content-type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    print("Successfully change history");
  }
}

Future<void> updateLastName(String lastName) async {
  String token = await readToken();

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
  String token = await readToken();

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
  String token = await readToken();

  String username = JwtDecoder.decode(token)["username"];

  final response = await http.post(
    Uri.parse("$url/update_info"),
    body: jsonEncode({"username": username, "query": "gender", "data": gender}),
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

Future<List<Goal>?> searchGoalByName(String name) async {
  final response = await http.post(
    Uri.parse("$url/get_goals_by_name"),
    body: jsonEncode({"name": name}),
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    List results = jsonDecode(response.body)["data"];
    List<Goal> data = [];
    for (final r in results) {
      data.add(Goal.fromJson(r));
    }

    return data;
  }

  return null;
}

Future<Goal?> getGoalByNameAndCalorie(String name, int calorie) async {
  final response = await http.post(
    Uri.parse("$url/get_goals_by_name_and_calorie"),
    body: jsonEncode({"name": name, "calorie": calorie}),
    headers: {"content-type": "application/json"},
  );

  if (response.statusCode == 200) {
    Goal data = Goal.fromJson(jsonDecode(response.body)["data"]);

    return data;
  }

  return null;
}
