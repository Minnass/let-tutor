import 'package:flutter/material.dart';
import 'package:lettutor/models/user/account.dart';
import 'package:lettutor/models/user/user.dart';

class AuthProvider extends ChangeNotifier {
  List<Account> accountList = [
    Account(email: 'phannhattrieu@gmail.com', password: '123123'),
    Account(email: 'nguyenanhtuan@gmail.com', password: '234'),
  ];
  User? currentUser;
  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  void logIn(User user) {
    currentUser = user;
    notifyListeners();
  }

  void logOut() {
    currentUser = null;
    notifyListeners();
  }

  bool checkLogin(Account account) {
    print('da');
    return accountList.any((element) =>
        element.email == account.email && element.password == account.password);
  }

  bool registerNewAccount(Account account) {
    if (accountList.any((element) => (element.email == account.email))) {
      return false;
    }
    accountList.add(account);
    notifyListeners();
    return true;
  }
}
