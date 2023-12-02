import 'package:flutter/material.dart';
import 'package:lettutor/models/account/account.dart';
import 'package:lettutor/models/account/user.dart';

class AuthProvider extends ChangeNotifier {
  List<Account> accountList = [
    Account(email: 'phannhattrieu@gmail.com', password: '123123'),
    Account(email: 'nguyenanhtuan@gmail.com', password: '234'),
  ];
  Account? currentAccount;
  void setUser(Account account) {
    currentAccount = account;
    notifyListeners();
  }

  void logIn(Account account) {
    currentAccount = account;
    notifyListeners();
  }

  void logOut() {
    currentAccount = null;
    notifyListeners();
  }

  bool checkLogin(Account account) {
    return accountList.any((element) =>
        element.email == account.email && element.password == account.password);
  }

  bool checkEmail(String email) {
    return accountList.any((element) => element.email == email);
  }

  bool registerNewAccount(Account account) {
    if (checkEmail(account.email ?? "")) {
      return false;
    }
    accountList.add(account);
    notifyListeners();
    return true;
  }
}
