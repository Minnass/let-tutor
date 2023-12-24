import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/domains/tuple.dart';

Tuple validateEmail(String email, LanguageProvider languageProvider) {
  final result = Tuple<bool, String>();
  final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (email.isEmpty) {
    result.setValues(true, languageProvider.language.emptyEmail);
  } else if (!emailRegExp.hasMatch(email)) {
    result.setValues(true, languageProvider.language.invalidEmail);
  } else {
    result.setValues(false, '');
  }
  return result;
}
