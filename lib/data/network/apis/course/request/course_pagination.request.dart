class PagedCourseRequest {
  int page;
  int size;
  PagedCourseRequest({required this.page, required this.size});
  Map<String, dynamic> toJson() {
    return {'page': page, 'size': size};
  }
}
