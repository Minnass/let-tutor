import 'package:lettutor/models/user/account.dart';

class User {
  String? id;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  Account? account;
  DateTime? birthday;

  User({
    this.id,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.account,
    this.birthday,
  });

  User.withAccount({this.account})
      : id = null,
        name = null,
        avatar = null,
        country = null,
        phone = null;
}
