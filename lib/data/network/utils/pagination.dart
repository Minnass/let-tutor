class PageInfo<T> {
  int? count;
  List<T>? rows;

  PageInfo({this.count, this.rows});
  factory PageInfo.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PageInfo<T>(
        count: json['count'],
        rows: json['rows'] != null
            ? (json['rows'] as List<dynamic>)
                .map((item) => fromJsonT(item as Map<String, dynamic>))
                .toList()
            : []);
  }
}
