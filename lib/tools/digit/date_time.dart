import 'package:shamsi_date/shamsi_date.dart';

class ConvertDateTime {
  static String toShamsi(String date) {
    try {
      var gregorianDate = Gregorian.fromDateTime(DateTime.parse(date));
      var shamsi = gregorianDate.toJalali();

      return "${shamsi.year}/${shamsi.month}/${shamsi.day}";
    } catch (e) {
      return "نامشخص";
    }
  }
}
