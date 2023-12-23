import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/utils/pagination.dart';

class BookedScheduleResponse {
  PageInfo<BookingInfoResponse>? data;
  String? message;
  BookedScheduleResponse({this.data, this.message});
  factory BookedScheduleResponse.fromJson(Map<String, dynamic> json) {
    return BookedScheduleResponse(
        data: json['data'] != null
            ? PageInfo<BookingInfoResponse>.fromJson(
                json['data'] as Map<String, dynamic>,
                (item) => BookingInfoResponse.fromJson(item),
              )
            : null,
        message: json['message']);
  }
}

