class TopicResponse {
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  final dynamic beforeTheClassNotes;
  final dynamic afterTheClassNotes;
  final dynamic numberOfPages;
  final dynamic description;
  final dynamic videoUrl;
  final dynamic type;
  String? createdAt;
  String? updatedAt;

  TopicResponse(
      {this.id,
      this.courseId,
      this.orderCourse,
      this.name,
      this.nameFile,
      this.beforeTheClassNotes,
      this.afterTheClassNotes,
      this.numberOfPages,
      this.description,
      this.videoUrl,
      this.type,
      this.createdAt,
      this.updatedAt});

  factory TopicResponse.fromJson(Map<String, dynamic> json) {
    return TopicResponse(
        id: json['id'],
        courseId: json['courseId'],
        orderCourse: json['orderCourse'],
        name: json['name'],
        nameFile: json['nameFile'],
        beforeTheClassNotes: json['beforeTheClassNotes'],
        afterTheClassNotes: json['afterTheClassNotes'],
        numberOfPages: json['numberOfPages'],
        description: json['description'],
        videoUrl: json['videoUrl'],
        type: json['type'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
