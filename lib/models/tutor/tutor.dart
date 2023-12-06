

import 'package:lettutor/models/feedback/feedback.dart';

class Tutor {
  final dynamic level;
  final String email;
  final dynamic google;
  final dynamic facebook;
  final dynamic apple;
  final dynamic avatar;
  final String name;
  final dynamic country;
  final dynamic phone;
  final dynamic language;
  final dynamic birthday;
  final bool requestPassword;
  final bool isActivated;
  final dynamic isPhoneActivated;
  final dynamic requireNote;
  final dynamic timezone;
  final dynamic phoneAuth;
  final bool isPhoneAuthActivated;
  final dynamic studySchedule;
  final bool canSendMessage;
  final bool isPublicRecord;
  final dynamic caredByStaffId;
  final dynamic zaloUserId;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;
  final dynamic studentGroupId;
  final List<MyFeedback> feedbacks;
  final String id;
  final String userId;
  final dynamic video;
  final dynamic bio;
  final dynamic education;
  final dynamic experience;
  final dynamic profession;
  final dynamic accent;
  final dynamic targetStudent;
  final dynamic interests;
  final List<String> languages;
  final List<String> specialties;
  final dynamic resume;
  final dynamic rating;
  final dynamic isNative;
  final dynamic youtubeVideoId;
  final int price;
  final bool isOnline;
  Tutor({
    required this.level,
    required this.email,
    required this.google,
    required this.facebook,
    required this.apple,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    required this.timezone,
    required this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    required this.caredByStaffId,
    required this.zaloUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentGroupId,
    required this.feedbacks,
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.resume,
    required this.rating,
    required this.isNative,
    required this.youtubeVideoId,
    required this.price,
    required this.isOnline,
  });
  static List<String> converLanguagesToList(String inputString) {
    List<String> labels = inputString.split(',');
    return labels;
  }

  static List<String> convertStringToSpecialties(String inputString) {
    List<String> labels = inputString.split(',');

    // Một mapping giữa các từ khóa trong chuỗi và nhãn tương ứng
    Map<String, String> keywordToLabel = {
      'business-english': 'English for Business',
      'conversational-english': 'Conversational',
      'english-for-kids': 'English for Kids',
      'ielts': 'IELTS',
      'starters': 'STARTERS',
      'movers': 'MOVERS',
      'flyers': 'FLYERS',
      'ket': 'KET',
      'pet': 'PET',
      'toefl': 'TOEFL',
      'toeic': 'TOEIC',
    };
    List<String> filterLabels = labels.map((label) {
      return keywordToLabel[label] ?? label;
    }).toList();

    return filterLabels;
  }

  List<String>? convertStringToLanguages(String? inputString) {
    List<String>? labels = inputString?.split(' ');

    return labels;
  }

  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      level: json['level'],
      email: json['email'],
      google: json['google'],
      facebook: json['facebook'],
      apple: json['apple'],
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      phone: json['phone'],
      language: json['language'],
      birthday: json['birthday'],
      requestPassword: json['requestPassword'],
      isActivated: json['isActivated'],
      isPhoneActivated: json['isPhoneActivated'],
      requireNote: json['requireNote'],
      timezone: json['timezone'],
      phoneAuth: json['phoneAuth'],
      isPhoneAuthActivated: json['isPhoneAuthActivated'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      isPublicRecord: json['isPublicRecord'],
      caredByStaffId: json['caredByStaffId'],
      zaloUserId: json['zaloUserId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      studentGroupId: json['studentGroupId'],
      feedbacks: List<MyFeedback>.from(
          json['feedbacks'].map((x) => MyFeedback.fromJson(x))),
      id: json['id'],
      userId: json['userId'],
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      accent: json['accent'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      languages: json['languages'] != null
          ? Tutor.converLanguagesToList(json['languages'])
          : [],
      specialties: json['specialties'] != null
          ? Tutor.convertStringToSpecialties(json['specialties'])
          : [],
      resume: json['resume'],
      rating: json['rating'],
      isNative: json['isNative'],
      youtubeVideoId: json['youtubeVideoId'],
      price: json['price'],
      isOnline: json['isOnline'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return this.name + this.email + this.createdAt;
  }
}
