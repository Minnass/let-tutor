import 'package:flutter/material.dart';
import 'package:lettutor/utils/language/english.dart';
import 'package:lettutor/utils/language/language.dart';

class LanguageProvider extends ChangeNotifier {
  Language language = English();
  String vi = 'Việt Nam';
  String en = "English";
  void setLanguage(Language language) {
    this.language = language;
    notifyListeners();
  }
}
