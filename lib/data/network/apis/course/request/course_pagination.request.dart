class PagedCourseRequest {
  int page;
  int size;
  String? level;
  String? categoryId;
  String? keyword;
  PagedCourseRequest({required this.page, required this.size});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'page': page,
      'size': size,
    };

    if (level != null && level!.isNotEmpty) {
      map['level'] = level;
    }
    if (categoryId != null && categoryId!.isNotEmpty) {
      map['categoryId'] = categoryId;
    }
      if (keyword != null && keyword!.isNotEmpty) {
      map['q'] = keyword;
    }

    return map;
  }
}
