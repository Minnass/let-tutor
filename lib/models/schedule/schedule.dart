import 'package:flutter/cupertino.dart';
import 'package:lettutor/models/schedule/schedule_detail.dart';

class Schedule extends ChangeNotifier {
  final String id;
  final String tutorId;
  final String startTime;
  final String endTime;
  final int startTimestamp;
  final int endTimestamp;
  String createdAt;
  bool isBooked;
  final List<ScheduleDetail> scheduleDetails;

  void booking()
  {
    isBooked=true;
  }
  Schedule({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
  });



  factory Schedule.fromJson(Map<String, dynamic> json) {
    List<ScheduleDetail> scheduleDetails = [];
    if (json['scheduleDetails'] != null) {
      scheduleDetails = (json['scheduleDetails'] as List)
          .map((detail) => ScheduleDetail.fromJson(detail))
          .toList();
    }

    return Schedule(
      id: json['id'] as String,
      tutorId: json['tutorId'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      startTimestamp: json['startTimestamp'] as int,
      endTimestamp: json['endTimestamp'] as int,
      createdAt: json['createdAt'] as String,
      isBooked: json['isBooked'] as bool,
      scheduleDetails: scheduleDetails,
    );
  }
}

