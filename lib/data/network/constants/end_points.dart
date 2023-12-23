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
  static const String googleLogin = baseUrl + "auth/google";
  static const String facebookLogin = baseUrl + "auth/facebook";
  static const String register = baseUrl + "auth/register";
  static const String forgotPassword = baseUrl + "user/forgotPassword";
  static const String getPaginatedTutors = baseUrl + "tutor/more";
  static const String getTutorDetails = baseUrl + "tutor/";
  static const String addFavoriteTutor = baseUrl + "user/manageFavoriteTutor";
  static const String writefeedback = baseUrl + "user/feedbackTutor";
  static const String getPagedCourse = baseUrl + "course";
  static const String getCourseDetails = baseUrl + 'course/';
  static const String bookedClass = baseUrl + 'booking/list/student';
  static const String lessonRequest = baseUrl + "booking/student-request";
}
