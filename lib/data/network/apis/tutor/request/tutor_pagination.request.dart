class GetPaginatedTutorRequest {
  late int perPage;
  late int page;
  GetPaginatedTutorRequest({required this.page, required this.perPage});
  Map<String, dynamic> toJson() {
    return {
      'perPage': perPage,
      'page': page,
    };
  }
}
