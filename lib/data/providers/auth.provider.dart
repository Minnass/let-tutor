import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/auth/response/register.response.dart';
import 'package:lettutor/domains/entity/course/learn_topic.dart';
import 'package:lettutor/domains/entity/course/test_preparationg.dart';
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
    currentToken = null;
    refreshToken = null;
    loginType = null;
    notifyListeners();
  }

  String getToken() {
    return currentToken?.token ?? '';
  }

  void updateUser(
      String name,
      String country,
      String? phone,
      String birthday,
      String level,
      String studySchedule,
      List<String> topics,
      List<String> tests) {
    currentUser?.name = name;
    currentUser?.country = country;
    currentUser?.phone = phone ?? currentUser?.phone;
    currentUser?.birthday = birthday;
    currentUser?.level = level;
    currentUser?.studySchedule = studySchedule;
    List<LearnTopic> learnTopics = [];
    List<TestPreparation> testPreparations = [];
    topics.forEach((element) {
      learnTopics.add(LearnTopic.getNew(element)!);
    });
    tests.forEach((element) {
      testPreparations.add(TestPreparation.getNew(element)!);
    });
    currentUser?.testPreparations = testPreparations;
    currentUser?.learnTopics = learnTopics;
    notifyListeners();
  }
}
