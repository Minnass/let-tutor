import 'package:dio/dio.dart';
import 'package:lettutor/data/network/apis/schedule/request/book_class.request.dart';
import 'package:lettutor/data/network/apis/schedule/request/booked_tutor.request.dart';
import 'package:lettutor/data/network/apis/schedule/request/cancle_schedule.request.dart';
import 'package:lettutor/data/network/apis/schedule/request/request_lesson.request.dart';
import 'package:lettutor/data/network/apis/schedule/request/tutor_schedule.request.dart';
import 'package:lettutor/data/network/apis/schedule/response/booked_schedule.response.dart';
import 'package:lettutor/data/network/apis/schedule/response/tutor_schedule.response.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/network/utils/custom_exception.dart';
import 'package:lettutor/data/network/utils/error.response.dart';

class ScheduleApi {
  final DioClient dioClient;
  ScheduleApi(this.dioClient);
  void setToken(String token) {
    dioClient.setToken(token);
  }

  Future<BookedScheduleResponse> getBookedTutors(
      BookedTutorRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.get(Endpoints.bookedClass,
          queryParameters: jsonRequest);
      return BookedScheduleResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<BookedScheduleResponse> getUpcomingSchedule(
      UpcomingScheduleRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.get(Endpoints.bookedClass,
          queryParameters: jsonRequest);
      return BookedScheduleResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<BookedScheduleResponse> getLatestUpcomingSchedule(
      LatestUpcomingSchedule request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.get(Endpoints.bookedClass,
          queryParameters: jsonRequest);
      return BookedScheduleResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<int> getTotalTime() async {
    try {
      final res = await dioClient.get(Endpoints.totalTime);
      return res['total'];
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> requestForLesson(LessonRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.post(
          '${Endpoints.lessonRequest}/${request.bookingId}',
          data: jsonRequest);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> cancleSchedule(CancleScheduleRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.delete('${Endpoints.cancleSchedule}',
          data: jsonRequest);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<TutorScheduleResponse> getScheduleWithTutorId(
      GetTutorSchduleRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res =
          await dioClient.post('${Endpoints.tutorSchedule}', data: jsonRequest);
      return TutorScheduleResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> bookClass(BookClassRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
          await dioClient.post('${Endpoints.bookClass}', data: jsonRequest);
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }
}
