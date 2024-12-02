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

String getDropdownString(String value) {
  switch (value) {
    case 'This Week':
      return 'this-week';
    case 'Last Week':
      return 'last-week';
    case 'Last Month':
      return 'last-month';
    case '03 Months':
      return 'last90days';
    case '06 Months':
      return 'half-yearly';
    case 'Quarterly':
      return 'quarterly';

    default:
      return '';
  }
}

String? getCalendarLabel(String val) {
  switch (val) {
    case 'today':
      return 'Today';
    case 'lastweek':
      return 'Last Week';
    case 'lastmonth':
      return 'Last Month';
    case 'last90days':
      return 'Last 90 Days';
    case 'customdate':
      return 'Custom Date';
  }
  return null;
}
