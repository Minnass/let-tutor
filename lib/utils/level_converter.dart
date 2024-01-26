import 'package:lettutor/const/level.dart';

String convertLevelToString(String level) {
  String result = "";

  Map<String, String> keywordToLabel = {
    '0': 'Any Level',
    '1': 'Beginner',
    '4': 'Intermediate',
    '7': 'Advanced'
  };

  result = keywordToLabel[level] ?? level;

  return result;
}

String? convertStringToLevel(String level) {
  for (var entry in levels.entries) {
    if (entry.value == level) {
      return entry.key;
    }
  }
  return null;
}
