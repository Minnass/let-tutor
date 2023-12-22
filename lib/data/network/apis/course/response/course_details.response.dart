import 'package:lettutor/data/network/apis/course/response/category.response.dart';
import 'package:lettutor/data/network/apis/course/response/course_pagination.response.dart';
import 'package:lettutor/data/network/apis/course/response/topic.response.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:lettutor/utils/level_converter.dart';

class CourseDetailsResponse {
  String? message;
  CourseTutorResponse? data;
  CourseDetailsResponse({this.message, this.data});
  factory CourseDetailsResponse.fromJson(Map<String, dynamic> json) {
    return CourseDetailsResponse(
        message: json['message'],
        data: json['data'] != null
            ? CourseTutorResponse.fromJson(json['data'])
            : null);
  }
}

class CourseTutorResponse extends CourseResponse {
  List<User>? users;
  CourseTutorResponse({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    String? reason,
    String? purpose,
    String? otherDetails,
    int? defaultPrice,
    int? coursePrice,
    dynamic courseType,
    dynamic sectionType,
    dynamic visible,
    dynamic displayOrder,
    String? createdAt,
    String? updatedAt,
    List<TopicResponse>? topics,
    this.users,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          level: level,
          reason: reason,
          purpose: purpose,
          otherDetails: otherDetails,
          defaultPrice: defaultPrice,
          coursePrice: coursePrice,
          courseType: courseType,
          sectionType: sectionType,
          visible: visible,
          displayOrder: displayOrder,
          createdAt: createdAt,
          updatedAt: updatedAt,
          topics: topics,
        );

  factory CourseTutorResponse.fromJson(Map<String, dynamic> json) {
    return CourseTutorResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      level: convertLevelToString(json['level']),
      reason: json['reason'],
      purpose: json['purpose'],
      otherDetails: json['other_details'],
      defaultPrice: json['default_price'],
      coursePrice: json['course_price'],
      courseType: json['courseType'],
      sectionType: json['sectionType'],
      visible: json['visible'],
      displayOrder: json['displayOrder'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      topics: (json['topics'] as List<dynamic>)
          .map((topicJson) => TopicResponse.fromJson(topicJson))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((userJson) => User.fromJson(userJson))
          .toList(),
    );
  }
}
