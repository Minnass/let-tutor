
import 'package:lettutor/domains/course/booking_info.dart';

class ScheduleDetail {
  final int startPeriodTimestamp;
  final int endPeriodTimestamp;
  final String id;
  final String scheduleId;
  final String startPeriod;
  final String endPeriod;
  final String createdAt;
  final String updatedAt;
  final List<BookingInfo> bookingInfo; 
  final bool isBooked;

  ScheduleDetail({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingInfo,
    required this.isBooked,
  });

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) {
    List<BookingInfo> booking_infor = [];
    if (json['bookingInfo'] != null) {
      booking_infor = (json['bookingInfo'] as List)
          .map((info) => BookingInfo.fromJson(info))
          .toList();
    }
    return ScheduleDetail(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int,
      id: json['id'] as String,
      scheduleId: json['scheduleId'] as String,
      startPeriod: json['startPeriod'] as String,
      endPeriod: json['endPeriod'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      bookingInfo: booking_infor,
      isBooked: json['isBooked'] as bool,
    );
  }
}
