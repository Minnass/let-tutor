import 'package:lettutor/domains/entity/course/learn_topic.dart';
import 'package:lettutor/domains/entity/course/test_preparationg.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:lettutor/domains/entity/user/wallet_info.dart';

class Tutor extends User {
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? languages;
  String? specialties;
  String? resume;
  double? rating;
  bool? isNative;
  int? price;
  bool? isOnline;

  Tutor({
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    this.isNative,
    this.price,
    this.isOnline,
    // User class properties
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    String? language,
    dynamic birthday,
    bool? isActivated,
    dynamic requireNote,
    dynamic level,
    dynamic isPhoneActivated,
    dynamic timezone,
    dynamic studySchedule,
    bool? canSendMessage,
    List<String>? roles,
    WalletInfo? walletInfo,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    dynamic studentGroupId,
    List<LearnTopic>? learnTopics,
    List<TestPreparation>? testPreparations,
  }) : super(
          id: id,
          email: email,
          name: name,
          avatar: avatar,
          country: country,
          phone: phone,
          language: language,
          birthday: birthday,
          isActivated: isActivated,
          requireNote: requireNote,
          level: level,
          isPhoneActivated: isPhoneActivated,
          timezone: timezone,
          studySchedule: studySchedule,
          canSendMessage: canSendMessage,
          roles: roles,
          walletInfo: walletInfo,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
          studentGroupId: studentGroupId,
          learnTopics: learnTopics,
          testPreparations: testPreparations,
        );
  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      accent: json['accent'],
      targetStudent: json['targetStudent'],
      languages: json['languages'],
      specialties: json['specialties'],
      resume: json['resume'],
      rating: json['rating'],
      isNative: json['isNative'],
      price: json['price'],
      isOnline: json['isOnline'],
      // User class properties
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      country: json['country'],
      phone: json['phone'],
      language: json['language'],
      birthday: json['birthday'],
      isActivated: json['isActivated'],
      requireNote: json['requireNote'],
      level: json['level'],
      isPhoneActivated: json['isPhoneActivated'],
      timezone: json['timezone'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      roles: json['roles']?.cast<String>(),
      walletInfo: json['walletInfo'] != null
          ? WalletInfo.fromJson(json['walletInfo'])
          : null,
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
          : [],
    );
  }
}
