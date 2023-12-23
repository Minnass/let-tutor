class ClassReviewResponse {
  String? bookingId;
  int? lessonStatusId;
  String? book;
  String? unit;
  String? lesson;
  dynamic page;
  String? lessonProgress;
  int? behaviorRating;
  String? behaviorComment;
  int? listeningRating;
  String? listeningComment;
  int? speakingRating;
  String? speakingComment;
  int? vocabularyRating;
  String? vocabularyComment;
  String? homeworkComment;
  String? overallComment;
  LessonStatus? lessonStatus;

  ClassReviewResponse({
    this.bookingId,
    this.lessonStatusId,
    this.book,
    this.unit,
    this.lesson,
    this.page,
    this.lessonProgress,
    this.behaviorRating,
    this.behaviorComment,
    this.listeningRating,
    this.listeningComment,
    this.speakingRating,
    this.speakingComment,
    this.vocabularyRating,
    this.vocabularyComment,
    this.homeworkComment,
    this.overallComment,
    this.lessonStatus,
  });

  factory ClassReviewResponse.fromJson(Map<String, dynamic> json) => ClassReviewResponse(
        bookingId: json['bookingId'],
        lessonStatusId: json['lessonStatusId'],
        book: json['book'],
        unit: json['unit'],
        lesson: json['lesson'],
        page: json['page'],
        lessonProgress: json['lessonProgress'],
        behaviorRating: json['behaviorRating'],
        behaviorComment: json['behaviorComment'],
        listeningRating: json['listeningRating'],
        listeningComment: json['listeningComment'],
        speakingRating: json['speakingRating'],
        speakingComment: json['speakingComment'],
        vocabularyRating: json['vocabularyRating'],
        vocabularyComment: json['vocabularyComment'],
        homeworkComment: json['homeworkComment'],
        overallComment: json['overallComment'],
        lessonStatus: LessonStatus.fromJson(json['lessonStatus']),
      );

  Map<String, dynamic> toJson() => {
        'bookingId': bookingId,
        'lessonStatusId': lessonStatusId,
        'book': book,
        'unit': unit,
        'lesson': lesson,
        'page': page,
        'lessonProgress': lessonProgress,
        'behaviorRating': behaviorRating,
        'behaviorComment': behaviorComment,
        'listeningRating': listeningRating,
        'listeningComment': listeningComment,
        'speakingRating': speakingRating,
        'speakingComment': speakingComment,
        'vocabularyRating': vocabularyRating,
        'vocabularyComment': vocabularyComment,
        'homeworkComment': homeworkComment,
        'overallComment': overallComment,
        'lessonStatus': lessonStatus!.toJson(),
      };
}

class LessonStatus {
  final int? id;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LessonStatus({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory LessonStatus.fromJson(Map<String, dynamic> json) => LessonStatus(
        id: json['id'],
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
