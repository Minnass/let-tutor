import 'package:flutter/material.dart';
import 'package:lettutor/domains/entity/course/course.dart';
import 'package:lettutor/domains/entity/course/learn_topic.dart';
import 'package:lettutor/domains/entity/course/test_preparationg.dart';
import 'package:lettutor/domains/entity/feedback/feedback.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:lettutor/domains/entity/user/wallet_info.dart';

class TutorInfo {
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? languages;
  String? specialties;
  String? youtubeVideoId;
  String? interests;
  String? resume;
  double? rating;
  bool? isNative;
  int? price;
  bool? isOnline;

  TutorInfo({
    this.id,
    this.userId,
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
    this.interests,
    this.youtubeVideoId,
  });
  factory TutorInfo.fromJson(Map<String, dynamic> json) {
    return TutorInfo(
        id: json['id'],
        userId: json['userId'],
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
        interests: json['interests'],
        youtubeVideoId: json['youtubeVideoId']);
  }
}
