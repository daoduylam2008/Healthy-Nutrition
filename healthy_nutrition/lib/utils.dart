import 'package:healthy_nutrition/models.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getAssetPath(String asset) async {
  final path = await getLocalPath(asset);
  await Directory(dirname(path)).create(recursive: true);
  final file = File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes(
      byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      ),
    );
  }
  return file.path;
}

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}

String dateToString(DateTime date) {
  String day = date.day.toString();
  String month = date.month.toString();
  String year = date.year.toString();

  if (day.length == 1) {
    day = "0$day";
  }
  if (month.length == 1) {
    month = "0$month";
  }

  return "$day/$month/$year";
}

DateTime stringToDate(String text) {
  var d = text.split('/');
  DateTime date = DateTime(int.parse(d[2]), int.parse(d[1]), int.parse(d[0]));

  return date;
}

double valueConverter(dynamic value, String unit, double portion) {
  double v = double.parse(value.toString());
  if (unit == "MG") {
    return 0.001 * v * portion / 100;
  } else if (unit == "UG") {
    return 0.000001 * v * portion / 100;
  } else {
    return v * portion / 100;
  }
}

Map<String, dynamic> nutritionCalculator(
  List<Food> foods,
  List<int> portions,
  List<int> amounts,
) {
  final Map<String, dynamic> nutrition = {};

  for (int i = 0; i < foods.length; i++) {
    var p;
    if (portions[i] == -1) {
      p = "Quantity not specified";
    } else {
      p = foods[i].portion.keys.toList()[portions[i]];
    }
    var nutrients = foods[i].nutrients;
    double portion = foods[i].portion[p].toDouble();

    // Basic nutrition summarization
    nutrition["Energy"] = nutrients["Energy"][0] * portion / 100;
    nutrition["Carbs"] = valueConverter(
      nutrients["Carbohydrate, by difference"][0],
      nutrients["Carbohydrate, by difference"][1],
      portion,
    );
    nutrition["Protein"] = valueConverter(
      nutrients["Protein"][0],
      nutrients["Protein"][1],
      portion,
    );
    nutrition["Fat"] = valueConverter(
      nutrients["Total lipid (fat)"][0],
      nutrients["Total lipid (fat)"][1],
      portion,
    );

    // Vitamin summarization
    nutrition["Vitamin A"] = valueConverter(
      (nutrients["Vitamin A, RAE"][0]).toDouble(),
      nutrients["Vitamin A, RAE"][1],
      portion,
    );
    nutrition["Vitamin B"] = valueConverter(
      nutrients["Vitamin B-12, added"][0].toDouble(),
      nutrients["Vitamin B-12, added"][1],
      portion,
    );
    nutrition["Vitamin E"] = valueConverter(
      nutrients["Vitamin E (alpha-tocopherol)"][0].toDouble(),
      nutrients["Vitamin E (alpha-tocopherol)"][1],
      portion,
    );
    nutrition["Vitamin E"] = valueConverter(
      nutrients["Vitamin E, added"][0].toDouble(),
      nutrients["Vitamin E, added"][1],
      portion,
    );
    nutrition["Vitamin K"] = valueConverter(
      nutrients["Vitamin K (phylloquinone)"][0].toDouble(),
      nutrients["Vitamin K (phylloquinone)"][1],
      portion,
    );
    nutrition["Vitamin B-12"] = valueConverter(
      nutrients["Vitamin B-12"][0].toDouble(),
      nutrients["Vitamin B-12"][1],
      portion,
    );
    nutrition["Vitamin B-12"] = valueConverter(
      nutrients["Vitamin B-12, added"][0].toDouble(),
      nutrients["Vitamin B-12, added"][1],
      portion,
    );
    nutrition["Vitamin B-6"] = valueConverter(
      nutrients["Vitamin B-6"][0].toDouble(),
      nutrients["Vitamin B-6"][1],
      portion,
    );
    nutrition["Vitamin D"] = valueConverter(
      nutrients["Vitamin D (D2 + D3)"][0].toDouble(),
      nutrients["Vitamin D (D2 + D3)"][1],
      portion,
    );
    nutrition["Vitamin C"] = valueConverter(
      nutrients["Vitamin C, total ascorbic acid"][0].toDouble(),
      nutrients["Vitamin C, total ascorbic acid"][1],
      portion,
    );

    // Mineral
    nutrition["Calcium-M"] = valueConverter(
      nutrients["Calcium, Ca"][0].toDouble(),
      nutrients["Calcium, Ca"][1],
      portion,
    );
    nutrition["Phosphorus-M"] = valueConverter(
      nutrients["Phosphorus, P"][0].toDouble(),
      nutrients["Phosphorus, P"][1],
      portion,
    );
    nutrition["Zinc-M"] = valueConverter(
      nutrients["Zinc, Zn"][0].toDouble(),
      nutrients["Zinc, Zn"][1],
      portion,
    );
    nutrition["Magnesium-M"] = valueConverter(
      nutrients["Magnesium, Mg"][0].toDouble(),
      nutrients["Magnesium, Mg"][1],
      portion,
    );
    nutrition["Copper-M"] = valueConverter(
      nutrients["Copper, Cu"][0].toDouble(),
      nutrients["Copper, Cu"][1],
      portion,
    );
    nutrition["Potassium-M"] = valueConverter(
      nutrients["Potassium, K"][0].toDouble(),
      nutrients["Potassium, K"][1],
      portion,
    );
    nutrition["Iron-M"] = valueConverter(
      nutrients["Iron, Fe"][0].toDouble(),
      nutrients["Iron, Fe"][1],
      portion,
    );
    nutrition["Selenium-M"] = valueConverter(
      nutrients["Selenium, Se"][0].toDouble(),
      nutrients["Selenium, Se"][1],
      portion,
    );
    nutrition["Sodium-M"] = valueConverter(
      nutrients["Sodium, Na"][0].toDouble(),
      nutrients["Sodium, Na"][1],
      portion,
    );
    nutrition["Water-M"] = valueConverter(
      nutrients["Water"][0].toDouble(),
      nutrients["Water"][1],
      portion,
    );

    // Fat
    nutrition["Total Saturated"] = valueConverter(
      nutrients["Fatty acids, total saturated"][0],
      nutrients["Fatty acids, total saturated"][1],
      portion,
    );
    nutrition["Total Monounsaturated"] = valueConverter(
      nutrients["Fatty acids, total monounsaturated"][0],
      nutrients["Fatty acids, total monounsaturated"][1],
      portion,
    );
    //
    nutrition["Total Polyunsaturated"] = valueConverter(
      nutrients["Fatty acids, total polyunsaturated"][0],
      nutrients["Fatty acids, total polyunsaturated"][1],
      portion,
    );
  }

  return nutrition;
}

bool isFavorite(UserInfo info, Food food) {
  for (final i in info.favorite) {
    if (i["description"] == food.description) {
      return true;
    }
  }
  return false;
}

List<DateTime> getDaysInTheWeek(DateTime date) {
  var weekDay = date.weekday;
  var firstDayOfWeek = date.subtract(Duration(days: weekDay));

  List<DateTime> results = [firstDayOfWeek];

  for (var i = 1; i < 7; i++) {
    results.add(firstDayOfWeek.add(Duration(days: i)));
  }
  return results;
}
