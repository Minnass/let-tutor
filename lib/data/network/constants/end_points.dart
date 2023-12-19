class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://sandbox.api.lettutor.com/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String login = baseUrl + "auth/login";
  static const String register = baseUrl + "auth/register";
  static const String forgotPassword = baseUrl + "user/forgotPassword";
}
