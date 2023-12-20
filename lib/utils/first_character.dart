String getFirstCharacters(String? input) {
  if (input != null) {
    List<String> words = input.split(' ');
    String result = words.fold('', (prev, word) => prev + word[0]);
    return result.toUpperCase();
  }
  return "NaN";
}
