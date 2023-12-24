import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/auth/response/register.response.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:lettutor/utils/enum/login_type.dart';

class AuthProvider extends ChangeNotifier {
  late User? currentUser;
  Token? currentToken;
  Token? refreshToken;
  late LoginType? loginType;
  void login(User? user, Token? token, Token? refresh, LoginType type) {
    currentUser = user;
    currentToken = token;
    refreshToken = refresh;
    loginType = type;
    notifyListeners();
  }

  User getCurrentUser() {
    return currentUser!;
  }

  void logout() {
    currentUser = null;
    currentToken = null;
    loginType = null;
    notifyListeners();
  }

  String getToken() {
    return currentToken?.token ?? '';
  }
}
