import 'package:lettutor/data/network/apis/schedule/response/class_review.respone.dart';
import 'package:lettutor/data/network/apis/schedule/response/schedule_detail.response.dart';

class BookingInfoResponse {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;

  // String? cancelReasonId;
  // String? lessonPlanId;
  // String? cancelNote;
  // String? calendarId;
  bool? isDeleted;
  ScheduleDetailResponse? scheduleDetailInfo;
  ClassReviewResponse? classReview;

  BookingInfoResponse({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    // this.cancelReasonId,
    // this.lessonPlanId,
    // this.cancelNote,
    // this.calendarId,
    this.isDeleted,
    this.scheduleDetailInfo,
    this.classReview,
  });

  BookingInfoResponse.fromJson(Map<String, dynamic> json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    scoreByTutor = json['scoreByTutor'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    recordUrl = json['recordUrl'];
    // cancelReasonId = json['cancelReasonId'];
    // lessonPlanId = json['lessonPlanId'];
    // cancelNote = json['cancelNote'];
    // calendarId = json['calendarId'];
    isDeleted = json['isDeleted'];
    scheduleDetailInfo = json['scheduleDetailInfo'] != null
        ? ScheduleDetailResponse.fromJson(json['scheduleDetailInfo'])
        : null;
    classReview = json['classReview'] != null
        ? ClassReviewResponse.fromJson(json['classReview'])
        : null;
  }
 
}
