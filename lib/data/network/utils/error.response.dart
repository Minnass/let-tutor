class CustomErrorResponse {
  final int statusCode;
  final String message;
  final int internalCode;

  CustomErrorResponse({
    required this.statusCode,
    required this.message,
    required this.internalCode,
  });

  factory CustomErrorResponse.fromJson(Map<String, dynamic> json) {
    return CustomErrorResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      internalCode: json['internalCode'],
    );
  }
}
