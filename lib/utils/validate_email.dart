import 'package:lettutor/models/tuple.dart';

Tuple validateEmail(String email) {
  final result = Tuple<bool, String>();
  final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  if (email.isEmpty) {
    result.setValues(true, "Email cannot be empty");
  } else if (!emailRegExp.hasMatch(email)) {
    result.setValues(true, "Email format must be abc@example.com");
  } else {
    result.setValues(false, '');
  }
  return result;
}
