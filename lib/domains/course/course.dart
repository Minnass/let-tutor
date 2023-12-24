import 'package:lettutor/domains/course/category.dart';
import 'package:lettutor/domains/course/topic.dart';

class Course {
  String id;
  String name;
  String description;
  String imageUrl;
  String level;
  String reason;
  String purpose;
  String otherDetails;
  int defaultPrice;
  int coursePrice;
  final dynamic courseType;
  final dynamic sectionType;
  final dynamic visible;
  final dynamic displayOrder;
  String createdAt;
  String updatedAt;
  List<Topic> topics;
  List<Category> categories;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.courseType,
    required this.sectionType,
    required this.visible,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.topics,
    required this.categories,
  });
  static String convertLevelToString(String level) {
    String result = "";

    Map<String, String> keywordToLabel = {
      '0': 'Any Level',
      '1': 'Beginner',
      '4': 'Intermediate',
    };

    result = keywordToLabel[level] ?? level;

    return result;
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
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
          .map((topicJson) => Topic.fromJson(topicJson))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList(),
    );
  }
}
