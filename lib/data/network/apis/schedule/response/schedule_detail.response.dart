import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/apis/schedule/response/schedule.response.dart';

class ScheduleDetailResponse {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfoResponse>? bookingInfo;
  bool? isBooked;
  ScheduleResponse? scheduleInfo;

  ScheduleDetailResponse({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
    this.scheduleInfo,
  });

  ScheduleDetailResponse.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      bookingInfo = <BookingInfoResponse>[];
      json['bookingInfo'].forEach((v) {
        bookingInfo!.add(BookingInfoResponse.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
    scheduleInfo = json['scheduleInfo'] != null
        ? ScheduleResponse.fromJson(json['scheduleInfo'])
        : null;
  }
}
