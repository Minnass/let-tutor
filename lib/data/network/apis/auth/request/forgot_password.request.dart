class ForgotPassword {
  String email;
  ForgotPassword({
    required this.email,
  });
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
