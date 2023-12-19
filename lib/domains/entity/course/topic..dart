class Topic {
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  dynamic beforeTheClassNotes;
  dynamic afterTheClassNotes;
  dynamic numberOfPages;
  dynamic description;
  dynamic videoUrl;
  dynamic type;
  String? createdAt;
  String? updatedAt;
  Topic({
    this.id,
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
    this.updatedAt,
  });
  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
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
