class TutorFeedbackRequest {
  String bookingId;
  String userId;
  int rating;
  String content;
  TutorFeedbackRequest(
      {required this.bookingId,
      required this.userId,
      required this.rating,
      required this.content});
  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'userId': userId,
      'rating': rating,
      'content': content,
    };
  }
}
