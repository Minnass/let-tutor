import 'package:lettutor/data/network/apis/schedule/request/booked_tutor.request.dart';
import 'package:lettutor/data/network/constants/end_points.dart';
import 'package:lettutor/data/network/dio_client.dart';

class ScheduleApi {
  final DioClient dioClient;
  ScheduleApi(this.dioClient);
  void setToken(String token) {
    dioClient.setToken(token);
  }
  Future<void> GetBookedSchedule(BookedTutorRequest request) async {
    try {
      Map<String, dynamic> jsonRequest = request.toJson();
      final res =
          await dioClient.get(Endpoints.writefeedback, data: jsonRequest);
    } on DioException catch (e) {
      final customError = CustomErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>);
      throw CustomException(customError.message);
    }
  }
  
}
