import 'package:intl/intl.dart';

String formatDateTimeString(String time) {
  DateTime dateTime = DateTime.parse(time);
  Duration difference = DateTime.now().difference(dateTime);
  String result;
  if (difference.inDays > 0) {
    if (difference.inDays >= 30) {
      int month = difference.inDays ~/ 30;
      if (month >= 12) {
        int year = month ~/ 12;
        result = '$year years ago';
      } else {
        result = '$month months ago';
      }
    } else {
      result = '${difference.inDays} days ago';
    }
  } else if (difference.inHours > 0) {
    result = '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    result = '${difference.inMinutes} minutes ago';
  } else {
    result = 'Just now';
  }
  return result;
}

String fromMilisecondToDateTime(int? milisecond) {
  if (milisecond == null) return '';

  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milisecond);

  String formattedDateTime = DateFormat('yyyy/MM/dd HH:mm:ss').format(dateTime);

  return formattedDateTime;
}
