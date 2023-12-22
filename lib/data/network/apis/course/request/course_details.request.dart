class CourseDetailsRequest {
  String courseId;
  CourseDetailsRequest({required this.courseId});
  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
    };
  }
}
