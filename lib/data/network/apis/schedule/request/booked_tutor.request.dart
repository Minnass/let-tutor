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
      'sortBy': sortBy,
    };
  }
}

class UpcomingScheduleRequest {
  int page;
  int perPage;
  int dateTimeGte;
  String orderBy;
  String sortBy;

  UpcomingScheduleRequest(
      {required this.page,
      required this.perPage,
      required this.dateTimeGte,
      required this.orderBy,
      required this.sortBy});
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'dateTimeGte': dateTimeGte,
      'orderBy': orderBy,
      'sortBy': sortBy,
    };
  }
}

class LatestUpcomingSchedule {
  int dateTime;

  LatestUpcomingSchedule({required this.dateTime});
  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
    };
  }
}
