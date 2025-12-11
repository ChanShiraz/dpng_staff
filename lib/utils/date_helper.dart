import 'package:intl/intl.dart';

class DateHelper {
  static String weekStart() {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: now.weekday - 1));
    return DateFormat('yyyy-MM-dd').format(start);
  }

  static String weekEnd() {
    final now = DateTime.now();
    final end = now.add(Duration(days: 7 - now.weekday));
    return DateFormat('yyyy-MM-dd').format(end);
  }
}
