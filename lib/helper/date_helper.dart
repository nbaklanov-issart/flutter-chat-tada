import 'package:intl/intl.dart';

class DateHelper {
  static DateFormat _messageDateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  static String convertToString(String serverFormat) {
    DateTime dateTime = DateTime.parse(serverFormat);
    return _messageDateFormat.format(dateTime);
  }
}