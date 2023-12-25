import 'package:dio/dio.dart';
import 'package:lettutor/data/network/apis/tutor/request/tutor_favorite.request.dart';
import 'package:lettutor/data/network/apis/tutor/request/tutor_feedback.request.dart';
import 'package:lettutor/data/network/apis/tutor/request/tutor_pagination.request.dart';
import 'package:lettutor/data/network/apis/tutor/response/tutor_pagination.response.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/network/utils/custom_exception.dart';
import 'package:lettutor/data/network/utils/error.response.dart';

class TutorApi {
  final DioClient dioClient;
  TutorApi(this.dioClient);
  void setToken(String token) {
    dioClient.setToken(token);
  }

  Future<GetPaginatedTutorResponse> getTutorsWithPagination(
      GetPaginatedTutorRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.get(Endpoints.getPaginatedTutors,
          queryParameters: jsonRequest);
      return GetPaginatedTutorResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> addFavoriteTutor(FavoriteTutorRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res =
          await dioClient.post(Endpoints.addFavoriteTutor, data: jsonRequest);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> writeFeedback(TutorFeedbackRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res =
          await dioClient.post(Endpoints.writefeedback, data: jsonRequest);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  
}
