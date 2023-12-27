import 'package:dio/dio.dart';

class BecomeTutorRequest {
  String? name;
  String? country;
  String? phone;
  String? birthday;
  String? interests;
  String? education;
  String? experience;
  String? profession;
  String? languages;
  String? bio;
  String? targetStudent;
  String? specialties;
  String? video;
  String? price;
  BecomeTutorRequest({
    this.name,
    this.country,
    this.phone,
    this.birthday,
    this.interests,
    this.education,
    this.experience,
    this.profession,
    this.languages,
    this.bio,
    this.targetStudent,
    this.specialties,
    this.video,
    this.price,
  });
  static Future<Map<String, dynamic>> toFormData(
      BecomeTutorRequest request) async {
    return {
      'name': request.name,
      'country': request.country,
      'phone': request.phone,
      'birthday': request.birthday,
      'interests': request.interests,
      'education': request.education,
      'experience': request.experience,
      'profession': request.profession,
      'languages': request.languages,
      'bio': request.bio,
      'targetStudent': request.targetStudent,
      'specialties': request.specialties,
      'video': await MultipartFile.fromFile(request.video!),
      'price': request.price
    };
  }
}
