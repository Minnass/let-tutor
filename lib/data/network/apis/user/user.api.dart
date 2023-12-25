import 'package:dio/dio.dart';
import 'package:lettutor/data/network/apis/user/request/update_info.request.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/network/utils/custom_exception.dart';
import 'package:lettutor/data/network/utils/error.response.dart';

class UserApi {
  final DioClient dioClient;
  UserApi(this.dioClient);
  void setToken(String token) {
    dioClient.setToken(token);
  }

  Future<void> updateInfor(UpdateRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.put(
        Endpoints.updateInfo,
        data: jsonRequest,
      );
      return;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> uploadAvatar(UpdateRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.put(
        Endpoints.uploadAvatar,
        data: jsonRequest,
      );
      return;
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }
}
