import 'package:dio/dio.dart';
import 'package:lettutor/data/network/apis/course/request/course_details.request.dart';
import 'package:lettutor/data/network/apis/course/request/course_pagination.request.dart';
import 'package:lettutor/data/network/apis/course/response/course_details.response.dart';
import 'package:lettutor/data/network/apis/course/response/course_pagination.response.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/network/utils/custom_exception.dart';
import 'package:lettutor/data/network/utils/error.response.dart';

class CourseApi {
  final DioClient _dioClient;
  CourseApi(this._dioClient);
  void setToken(String token) {
    _dioClient.setToken(token);
  }

  Future<GetPagedCourseResponse> getPagedCourse(
      PagedCourseRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.get(Endpoints.getPagedCourse,
          queryParameters: jsonRequest);
      return GetPagedCourseResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<CourseDetailsResponse> getCourseDetails(
      CourseDetailsRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.get(
        '${Endpoints.getCourseDetails}/${request.courseId}',
      );
      return CourseDetailsResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      throw CustomException(customError.message);
    }
  }
}
