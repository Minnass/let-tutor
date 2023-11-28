import 'package:lettutor/models/user/account.dart';

class User {
  String? id;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  Account? account;

  // Constructor 1: Default values are used for other fields
  User({
    this.id,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.account,
  });

  // Constructor 2: Named constructor with only account parameter
  User.withAccount({this.account})
      : id = null,
        name = null,
        avatar = null,
        country = null,
        phone = null;
}
