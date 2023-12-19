import 'package:lettutor/domains/entity/course/learn_topic.dart';
import 'package:lettutor/domains/entity/course/test_preparationg.dart';
import 'package:lettutor/domains/entity/user/wallet_info.dart';

class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  String? language;
  dynamic birthday;
  bool? isActivated;
  dynamic requireNote;
  dynamic level;
  dynamic isPhoneActivated;
  dynamic timezone;
  dynamic studySchedule;
  bool? canSendMessage;
  List<String>? roles;
  WalletInfo? walletInfo;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  dynamic studentGroupId;
  List<LearnTopic>? learnTopics;
  List<TestPreparation>? testPreparations;
  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.isActivated,
    this.requireNote,
    this.level,
    this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    this.canSendMessage,
    this.walletInfo,
    this.roles,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.studentGroupId,
    this.learnTopics,
    this.testPreparations,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        level: json['level'],
        email: json['email'],
        avatar: json['avatar'],
        name: json['name'],
        country: json['country'],
        phone: json['phone'],
        language: json['language'],
        birthday: json['birthday'],
        isActivated: json['isActivated'],
        isPhoneActivated: json['isPhoneActivated'],
        requireNote: json['requireNote'],
        timezone: json['timezone'],
        studySchedule: json['studySchedule'],
        canSendMessage: json['canSendMessage'],
        id: json['id'],
        walletInfo: json['walletInfo'] != null
            ? WalletInfo.fromJson(json['walletInfo'])
            : null,
        roles: json['roles']?.cast<String>(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        deletedAt: json['deletedAt'],
        studentGroupId: json['studentGroupId'],
        learnTopics: json['learnTopics'] != null
            ? (json['learnTopics'] as List<dynamic>)
                .map((item) => LearnTopic.fromJson(item))
                .toList()
            : [],
        testPreparations: json['testPreparations'] != null
            ? (json['testPreparations'] as List<dynamic>)
                .map((item) => TestPreparation.fromJson(item))
                .toList()
            : []);
  }

  static List<String> converLanguagesToList(String inputString) {
    List<String> labels = inputString.split(',');
    return labels;
  }

  List<String>? convertStringToLanguages(String? inputString) {
    List<String>? labels = inputString?.split(' ');

    return labels;
  }
}
