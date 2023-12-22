class LoginRequest {
  String email;
  String password;
  LoginRequest({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class GoogleLoginRequest {
  String access_token;
  GoogleLoginRequest({required this.access_token});
  Map<String, dynamic> toJson() {
    return {
      'access_token': access_token,
    };
  }
}

class FacebookLoginRequest {
  String access_token;
  FacebookLoginRequest({required this.access_token});
  Map<String, dynamic> toJson() {
    return {
      'access_token': access_token,
    };
  }
}
