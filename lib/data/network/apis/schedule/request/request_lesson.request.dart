class LessonRequest {
  String studentRequest;
  String bookingId;

  LessonRequest({required this.studentRequest, required this.bookingId});
  Map<String, dynamic> toJson() {
    return {
      'studentRequest': studentRequest,
    };
  }
}
