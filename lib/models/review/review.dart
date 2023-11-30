import 'package:lettutor/models/student/student.dart';

class RatingComment {
  double? rating;
  String? comment;
  DateTime? time;
  Student? student;

  RatingComment(
      {required this.rating,
      required this.comment,
      required this.time,
      required this.student});

  RatingComment.getDefault() {
    rating = 4;
    comment = "He is best teacher";
    time = DateTime.now();
    student = Profile.getDefault();
  }
}