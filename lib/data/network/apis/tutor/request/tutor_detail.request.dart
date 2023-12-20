class GetTutorDetailsRequest {
  late String tutorId;
  GetTutorDetailsRequest({required this.tutorId});
  Map<String, dynamic> toJson() {
    return {
      'tutorId': tutorId,
    };
  }
}
