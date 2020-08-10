import 'package:intl/intl.dart';

class TimeUtil {
  static int convertDayToNumber(String day) {
    switch (day) {
      case 'Minggu':
        return 7;
      case 'Senin':
        return 1;
      case 'Selasa':
        return 2;
      case 'Rabu':
        return 3;
      case 'Kamis':
        return 4;
      case 'Jumat':
        return 5;
      case 'Sabtu':
        return 6;
    }
  }

  static String convertDayToString(int day) {
    switch (day) {
      case 7:
        return 'Minggu';
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
    }
  }

  static String formatDate(String date){
    final from = new DateFormat('yyyy-MM-dd HH:mm:ss');
    final to = new DateFormat('yyyy-MM-dd HH:mm:ss');

    DateTime tempDate = from.parse(date);
    String dateF = to.format(tempDate);
    return dateF;
  }
}

var days = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
];

enum WEEKDAY {
  MINGGU,
  SENIN,
  SELASA,
  RABU,
  KAMIS,
  JUMAT,
  SABTU,
}

class DateTimeSelected{
  String date;
  int weekdayNumber;
  String weekdayName;


  DateTimeSelected(this.date, this.weekdayNumber, this.weekdayName);

  @override
  String toString() {
    return 'DateTimeSelected{date: $date, weekdayNumber: $weekdayNumber, weekdayName: $weekdayName}';
  }
}

