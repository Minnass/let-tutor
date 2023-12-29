class GetTutorSchduleRequest {
  String tutorId;

  GetTutorSchduleRequest({required this.tutorId});
  Map<String, dynamic> toJson() {
    return {
      'tutorId': tutorId,
    };
  }
}
