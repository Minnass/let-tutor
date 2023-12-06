import 'package:lettutor/const/countries.dart';

String convertFromCodeToName(String countryCode) {
  return countryList[countryCode] ?? '';
}
