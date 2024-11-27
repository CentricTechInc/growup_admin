class DateRangeModel {
  final DateTime? to;
  final DateTime? from;

  DateRangeModel({this.to, this.from});
}

enum CalendarPeriod { today, lastweek, lastmonth, last90days, customdate }
