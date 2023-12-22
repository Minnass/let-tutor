class CategoryResponse {
  String? id;
  String? title;
  final dynamic description;
  String? key;
  final dynamic displayOrder;
  String? createdAt;
  String? updatedAt;

  CategoryResponse(
      {this.id,
      this.title,
      this.description,
      this.key,
      this.displayOrder,
      this.createdAt,
      this.updatedAt});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        key: json['key'],
        displayOrder: json['displayOrder'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
