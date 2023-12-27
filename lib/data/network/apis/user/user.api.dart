import 'package:dio/dio.dart';
import 'package:lettutor/data/network/apis/user/request/become_tutor.request.dart';
import 'package:lettutor/data/network/apis/user/request/update_info.request.dart';
import 'package:lettutor/data/network/apis/user/response/update_info.response.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/network/utils/custom_exception.dart';
import 'package:lettutor/data/network/utils/error.response.dart';
import 'package:lettutor/domains/entity/user/user.dart';

class UserApi {
  final DioClient dioClient;
  UserApi(this.dioClient);
  void setToken(String token) {
    dioClient.setToken(token);
  }

  Future<User> updateInfor(UpdateRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await dioClient.put(
        Endpoints.updateInfo,
        data: jsonRequest,
      );
      return UpdateInfoResponse.fromJson(res).user;
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<User> uploadAvatar(String imagePath) async {
    try {
      var formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imagePath,
        ),
      });
      final res = await dioClient.post(
        Endpoints.uploadAvatar,
        data: formData,
      );
      return User.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> becomeTutor(BecomeTutorRequest request) async {
    try {
      var formData =
          FormData.fromMap(await BecomeTutorRequest.toFormData(request));
      await dioClient.post(
        Endpoints.becomeTutor,
        data: formData,
      );
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      print(e.response?.data);
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }
}
