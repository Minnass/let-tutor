import 'package:lettutor/data/network/apis/schedule/response/schedule_detail.response.dart';
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
  List<ScheduleDetailResponse>? scheduleDetails;
  ScheduleResponse(
      {this.id,
      this.tutorId,
      this.startTime,
      this.endTime,
      this.startTimestamp,
      this.endTimestamp,
      this.createdAt,
      this.isBooked,
      this.tutorInfo,
      this.scheduleDetails});

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
        tutorInfo:
            json['tutorInfo'] != null ? User.fromJson(json['tutorInfo']) : null,
        scheduleDetails: json['scheduleDetails'] != null
            ? (json['scheduleDetails'] as List<dynamic>)
                .map((schedule) => ScheduleDetailResponse.fromJson(schedule))
                .toList()
            : []);
  }
}
