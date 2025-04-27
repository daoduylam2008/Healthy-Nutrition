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
}
