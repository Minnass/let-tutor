import 'package:lettutor/data/network/utils/pagination.dart';
import 'package:lettutor/domains/entity/feedback/feedback.dart';
import 'package:lettutor/domains/entity/user/user.dart';

class FavoriteTutorResponse {
  String? id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  User? secondInfo;
  FavoriteTutorResponse({
    this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });
  factory FavoriteTutorResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteTutorResponse(
        id: json['id'],
        firstId: json['firstId'],
        secondId: json['secondId'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        secondInfo: json['secondInfo'] != null
            ? User.fromJson(json['secondInfo'])
            : null);
  }
}

class TutorResponse extends User {
  String? tutorId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  List<String>? languages;
  List<String>? specialties;
  List<MyFeedback>? feedbacks;
  String? resume;
  double? rating;
  bool? isNative;
  int? price;
  bool? isOnline;
  dynamic youtubeVideoId;
  String? interests;
  TutorResponse({
    this.tutorId,
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
    this.feedbacks,
    this.interests,
    this.youtubeVideoId,
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    String? language,
    dynamic zaloUserId,
    dynamic birthday,
    bool? isActivated,
    dynamic requireNote,
    dynamic level,
    dynamic isPhoneActivated,
    dynamic timezone,
    dynamic google,
    dynamic facebook,
    dynamic apple,
    dynamic studySchedule,
    bool? canSendMessage,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    dynamic studentGroupId,
    dynamic requestPassword,
    dynamic phoneAuth,
    dynamic isPhoneAuthActivated,
  }) : super(
          id: id,
          email: email,
          name: name,
          avatar: avatar,
          country: country,
          phone: phone,
          zaloUserId: zaloUserId,
          language: language,
          birthday: birthday,
          isActivated: isActivated,
          requireNote: requireNote,
          level: level,
          isPhoneActivated: isPhoneActivated,
          timezone: timezone,
          google: google,
          facebook: facebook,
          apple: apple,
          studySchedule: studySchedule,
          canSendMessage: canSendMessage,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
          studentGroupId: studentGroupId,
          requestPassword: requestPassword,
          phoneAuth: phoneAuth,
          isPhoneAuthActivated: isPhoneAuthActivated,
        );
  factory TutorResponse.fromJson(Map<String, dynamic> json) {
    return TutorResponse(
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
      zaloUserId: json['zaloUserId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      studentGroupId: json['studentGroupId'],
      feedbacks: json['feedbacks'] != null
          ? List<MyFeedback>.from(
              json['feedbacks'].map((x) => MyFeedback.fromJson(x)))
          : [],
      id: json['userId'],
      tutorId: json['id'],
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      accent: json['accent'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      languages: json['languages'] != null
          ? TutorResponse.converLanguagesToList(json['languages'])
          : [],
      specialties: json['specialties'] != null
          ? TutorResponse.convertStringToSpecialties(json['specialties'])
          : [],
      resume: json['resume'],
      rating: json['rating'],
      isNative: json['isNative'],
      youtubeVideoId: json['youtubeVideoId'],
      price: json['price'],
      isOnline: json['isOnline'],
    );
  }
  static List<String> converLanguagesToList(String inputString) {
    List<String> labels = inputString.split(',');
    return labels;
  }

  static List<String>? convertStringToLanguages(String? inputString) {
    List<String>? labels = inputString?.split(' ');

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
}

class GetPaginatedTutorResponse {
  PageInfo<TutorResponse>? tutors;
  List<FavoriteTutorResponse>? favoriteTutors;
  GetPaginatedTutorResponse({this.tutors, this.favoriteTutors});
  factory GetPaginatedTutorResponse.fromJson(Map<String, dynamic> json) {
    return GetPaginatedTutorResponse(
      tutors: json['tutors'] != null
          ? PageInfo<TutorResponse>.fromJson(
              json['tutors'] as Map<String, dynamic>,
              (item) => TutorResponse.fromJson(item),
            )
          : null,
      favoriteTutors: json['favoriteTutor'] != null
          ? (json['favoriteTutor'] as List<dynamic>)
              .map((tutor) => FavoriteTutorResponse.fromJson(tutor))
              .toList()
          : [],
    );
  }
}
