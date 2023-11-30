import 'package:lettutor/models/user/user.dart';

class Student extends User {
  String? level;
  List<String> wantToLearn = [];
  Student.getDefault() {
    name = "Pham Minh Vuong";
    account?.email = "windymv025@gmail.com";
    country = "Viet Nam";
    phone = "08868805301";
    birthday = DateTime.utc(2000, 10, 25);
    level = "Beginner";
    wantToLearn = ["English for beginer", "TOIEC"];
  }
}
