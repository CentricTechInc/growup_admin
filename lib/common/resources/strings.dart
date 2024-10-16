import 'package:intl/intl.dart';

class Strings {
  static const appName = "Grow Up Admin Panel";
  static const fontFamily = "Poppins";
}

enum AppointmentStatus { completed, pending, cancelled, upcoming }

extension EnumTitleCase on AppointmentStatus {
  String toTitleCase() {
    String enumValue = toString().split('.').last;
    return enumValue[0].toUpperCase() + enumValue.substring(1).toLowerCase();
  }
}

DateTime? stringToDateTime(String dateString,
    {String formatPattern = "YYYY-MM-DD"}) {
  try {
    // DateFormat format = DateFormat(formatPattern);
    DateTime dateTime = DateTime.parse(dateString);

    return dateTime;
  } catch (e) {
    // Handle parsing errors here, e.g., return a default value or throw an exception.
    return null;
  }
}

String dateToMonthName(DateTime date) {
  String monthName = DateFormat('MMMM').format(date);
  return monthName;
}
