import 'package:lettutor/data/network/apis/schedule/response/schedule.response.dart';

class TutorScheduleResponse {
  String? message;
  List<ScheduleResponse>? data;

  TutorScheduleResponse({
    this.message,
    this.data,
  });

  factory TutorScheduleResponse.fromJson(Map<String, dynamic> json) {
    return TutorScheduleResponse(
        message: json['message'],
        data: json['data'] != null
            ? (json['data'] as List<dynamic>)
                .map((schedule) => ScheduleResponse.fromJson(schedule))
                .toList()
            : []);
  }
}

