import 'package:lettutor/models/student/student.dart';
import 'package:lettutor/utils/datetime_converter.dart';

class Feedback {
  final dynamic id;
  final dynamic bookingId;
  final dynamic firstId;
  final dynamic secondId;
  final dynamic rating;
  final dynamic content;
  final String createdAt;
  final String updatedAt;
  final Student firstInfo;
  Feedback({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });
  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      id: json['id'],
      bookingId: json['bookingId'],
      firstId: json['firstId'],
      secondId: json['secondId'],
      rating: json['rating'],
      content: json['content'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']!=null?formatDateTimeString(json['updatedAt']):"",
      firstInfo: Student.fromJson(json['firstInfo']),
    );
  }
}