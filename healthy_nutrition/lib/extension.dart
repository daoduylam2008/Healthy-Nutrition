import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension DateTimeExtension on DateTime {
  String dateToString() {
    String day = "${this.day}";
    String month = "${this.month}";
    String year = "${this.year}";

    if (day.length == 1) {
      day = "0${this.day}";
    }
    if (month.length == 1) {
      month = "0${this.month}";
    }

    return "$day/$month/$year";
  }

  String date() {
    return DateFormat("EEEE").format(this);
  }
}

extension DoubleExtension on double {
  double roundNum(int value) {
    return double.parse((this).toStringAsFixed(value));
  }
}
