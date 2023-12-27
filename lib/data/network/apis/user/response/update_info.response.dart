import 'package:lettutor/domains/entity/user/user.dart';

class UpdateInfoResponse {
  User user;
  UpdateInfoResponse({required this.user});
  factory UpdateInfoResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInfoResponse(user: User.fromJson(json['user']));
  }
}
