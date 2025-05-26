import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/models.dart';

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

double valueConverter(double value, String unit) {
  if (unit == "MG") {
    return 0.001 * value;
  } else if (unit == "UG") {
    return 0.000001 * value;
  } else {
    return value;
  }
}

Map<String, dynamic> nutritionCalculator(List<Food> foods) {
  Map<String, dynamic> nutrition = {
    "Energy": 0.0,
    "Protein": 0.0,
    "Fat": 0.0,
    "Carbs": 0.0,
  };

  for (int i = 0; i < foods.length; i++) {
    var nutrients = foods[i].nutrients;
    nutrition["Energy"] += nutrients["Energy"][0];
    nutrition["Carbs"] += valueConverter(
      nutrients["Carbohydrate, by difference"][0],
      nutrients["Carbohydrate, by difference"][1],
    ).roundNum(1);
    nutrition["Protein"] += valueConverter(
      nutrients["Protein"][0],
      nutrients["Protein"][1],
    ).roundNum(1);
    nutrition["Fat"] += valueConverter(
      nutrients["Total lipid (fat)"][0],
      nutrients["Total lipid (fat)"][1],
    ).roundNum(1);
  }
  return nutrition;
}
