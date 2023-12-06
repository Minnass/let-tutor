import 'package:flutter/material.dart';
import 'package:lettutor/models/account/account.dart';
import 'package:lettutor/models/account/user.dart';
import 'package:lettutor/models/tutor/tutor.dart';

class AuthProvider extends ChangeNotifier {
  List<Account> accountList = [
    Account(email: 'phannhattrieu@gmail.com', password: '123123'),
    Account(email: 'nguyenanhtuan@gmail.com', password: '234'),
  ];
  Tutor tutor = Tutor(
      level: 'Beginner',
      email: 'phannhattrieu@gmail.com ',
      google: null,
      facebook: null,
      apple: null,
      avatar:
          'https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1686033849227.jpeg',
      name: 'Phan Nhat Trieu',
      country: 'VN',
      phone: '0862877320',
      language: 'Viet Nam',
      birthday: '2023-12-01',
      requestPassword: false,
      isActivated: true,
      isPhoneActivated: true,
      requireNote: null,
      timezone: 7,
      phoneAuth: null,
      isPhoneAuthActivated: true,
      studySchedule: null,
      canSendMessage: false,
      isPublicRecord: true,
      caredByStaffId: null,
      zaloUserId: null,
      createdAt: '2021-08-09T02:20:28.789Z',
      updatedAt: '2021-08-09T02:20:28.789Z',
      deletedAt: null,
      studentGroupId: null,
      feedbacks: [],
      id: 'dadadaada',
      userId: 'd0f38cc1-a93b-4640-8252-94b275b807c',
      video: null,
      bio: 'Love song',
      education: 'BA',
      experience: 'Have no experience',
      profession: null,
      accent: null,
      targetStudent: null,
      interests: null,
      languages: ['en', 'vn'],
      specialties: [
        'English for Business',
        'Conversational',
        'English for Kids',
        'IELTS'
      ],
      resume: null,
      rating: 5,
      isNative: true,
      youtubeVideoId: null,
      price: 10000,
      isOnline: true);
  Account? currentAccount;
  void updateAccount(
      String name, dynamic studySchedule, dynamic country, dynamic birthday) {
    tutor.name = name;
    tutor.studySchedule = studySchedule;
    tutor.birthday = birthday;
    tutor.country = country;
    print(name + studySchedule + country + birthday);
    notifyListeners();
  }

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
