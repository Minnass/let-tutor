import 'package:lettutor/data/network/utils/pagination.dart';
import 'package:lettutor/utils/level_converter.dart';

import 'category.response.dart';
import 'topic.response.dart';

class CourseResponse {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  dynamic courseType;
  dynamic sectionType;
  dynamic visible;
  dynamic displayOrder;
  String? createdAt;
  String? updatedAt;
  List<TopicResponse>? topics;
  List<CategoryResponse>? categories;
  CourseResponse({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.courseType,
    this.sectionType,
    this.visible,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.categories,
  });
 

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
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
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => CategoryResponse.fromJson(categoryJson))
          .toList(),
    );
  }
}

class GetPagedCourseResponse {
  PageInfo<CourseResponse>? data;
  String? message;
  GetPagedCourseResponse({required this.data, required this.message});
  factory GetPagedCourseResponse.fromJson(Map<String, dynamic> json) {
    return GetPagedCourseResponse(
      data: json['data'] != null
          ? PageInfo<CourseResponse>.fromJson(
              json['data'] as Map<String, dynamic>,
              (item) => CourseResponse.fromJson(item),
            )
          : null,
          message: json['message']
    );
  }
}
