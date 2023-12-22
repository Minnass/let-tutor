String convertLevelToString(String level) {
  String result = "";

  Map<String, String> keywordToLabel = {
    '0': 'Any Level',
    '1': 'Beginner',
    '4': 'Intermediate',
  };

  result = keywordToLabel[level] ?? level;

  return result;
}
