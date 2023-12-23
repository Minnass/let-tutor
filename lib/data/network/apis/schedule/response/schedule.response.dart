import 'package:lettutor/domains/entity/user/user.dart';

class ScheduleResponse {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  User? tutorInfo;

  ScheduleResponse({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.tutorInfo,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleResponse(
        id: json['id'],
        tutorId: json['tutorId'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        startTimestamp: json['startTimestamp'],
        endTimestamp: json['endTimestamp'],
        createdAt: json['createdAt'],
        isBooked: json['isBooked'],
        tutorInfo: json['tutorInfo'] != null
            ? User.fromJson(json['tutorInfo'])
            : null);
  }
}
