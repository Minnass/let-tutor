class BookedTutorRequest {
  int page;
  int perPage;
  int dateTimeLte;
  String orderBy;
  String sortBy;

  BookedTutorRequest(
      {required this.page,
      required this.perPage,
      required this.dateTimeLte,
      required this.orderBy,
      required this.sortBy});
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'dateTimeLte': dateTimeLte,
      'orderBy': orderBy,
      'orderBy': orderBy, 
    };
  }
}
