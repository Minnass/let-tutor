class FavoriteTutorRequest {
  late String tutorId;
  FavoriteTutorRequest({required this.tutorId});
  Map<String, dynamic> toJson() {
    return {
      'tutorId': tutorId,
    };
  }
}
