import 'package:lettutor/data/network/apis/auth/response/register.response.dart';
import 'package:lettutor/domains/entity/user/user.dart';

class LoginResponse {
  User? user;
  TokenResponse? tokens;
  LoginResponse({this.user, this.tokens});
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        tokens: json['tokens'] != null
            ? TokenResponse.fromJson(json['tokens'])
            : null);
  }
}
