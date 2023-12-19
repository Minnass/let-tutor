import 'package:lettutor/domains/entity/user/user.dart';

class Token {
  String? token;
  dynamic expires;
  Token({
    this.token,
    this.expires,
  });
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token'], expires: json['expires']);
  }
}

class TokenResponse {
  Token? access;
  Token? refresh;
  TokenResponse({this.access, this.refresh});
  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
        access: json['access'] != null ? Token.fromJson(json['access']) : null,
        refresh:
            json['refresh'] != null ? Token.fromJson(json['refresh']) : null);
  }
}

class RegisterResponse {
  User? user;
  TokenResponse? tokens;
  RegisterResponse({this.user, this.tokens});
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        tokens: json['tokens'] != null
            ? TokenResponse.fromJson(json['tokens'])
            : null);
  }
}
