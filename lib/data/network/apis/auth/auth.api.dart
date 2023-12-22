import 'package:dio/dio.dart';
import 'package:lettutor/data/network/apis/auth/request/forgot_password.request.dart';
import 'package:lettutor/data/network/apis/auth/request/login.request.dart';
import 'package:lettutor/data/network/apis/auth/request/register.request.dart';
import 'package:lettutor/data/network/apis/auth/response/login.response.dart';
import 'package:lettutor/data/network/apis/auth/response/register.response.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/network/utils/custom_exception.dart';
import 'package:lettutor/data/network/utils/error.response.dart';

class AuthApi {
  final DioClient _dioClient;
  AuthApi(this._dioClient);
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.post(
        Endpoints.register,
        data: jsonRequest,
      );
      return RegisterResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.post(
        Endpoints.login,
        data: jsonRequest,
      );
      return LoginResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<LoginResponse> loginByGoogle(GoogleLoginRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.post(
        Endpoints.googleLogin,
        data: jsonRequest,
      );
      return LoginResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<LoginResponse> loginByFacebook(FacebookLoginRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.post(
        Endpoints.facebookLogin,
        data: jsonRequest,
      );
      return LoginResponse.fromJson(res);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }

  Future<void> forgotPassword(ForgotPassword request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res = await _dioClient.post(
        Endpoints.forgotPassword,
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
