import 'package:lettutor/domains/entity/course/course.dart';
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
  dynamic zaloUserId;
  dynamic birthday;
  bool? isActivated;
  dynamic requireNote;
  dynamic level;
  dynamic isPhoneActivated;
  dynamic timezone;
  dynamic google;
  dynamic facebook;
  dynamic apple;
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
  List<Course>? courses;
  dynamic requestPassword;
  dynamic phoneAuth;
  dynamic isPhoneAuthActivated;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.zaloUserId,
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
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.learnTopics,
    this.testPreparations,
    this.courses,
    this.apple,
    this.facebook,
    this.google,
    this.requestPassword,
    this.phoneAuth,
    this.isPhoneAuthActivated,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      country: json['country'],
      phone: json['phone'],
      zaloUserId: json['zaloUserId'],
      language: json['language'],
      birthday: json['birthday'],
      isActivated: json['isActivated'],
      requireNote: json['requireNote'],
      level: json['level'],
      isPhoneActivated: json['isPhoneActivated'],
      timezone: json['timezone'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      walletInfo: json['walletInfo'] != null
          ? WalletInfo.fromJson(json['walletInfo'])
          : null,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      studentGroupId: json['studentGroupId'],
      learnTopics: json['learnTopics'] != null
          ? List<LearnTopic>.from(
              json['learnTopics'].map((x) => LearnTopic.fromJson(x)))
          : null,
      testPreparations: json['testPreparations'] != null
          ? List<TestPreparation>.from(
              json['testPreparations'].map((x) => TestPreparation.fromJson(x)))
          : null,
      courses: json['courses'] != null
          ? List<Course>.from(json['courses'].map((x) => Course.fromJson(x)))
          : null,
      apple: json['apple'],
      facebook: json['facebook'],
      google: json['google'],
      requestPassword: json['requestPassword'],
      phoneAuth: json['phoneAuth'],
      isPhoneAuthActivated: json['isPhoneAuthActivated'],
    );
  }
}
