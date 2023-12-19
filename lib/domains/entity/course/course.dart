class Course {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  bool? visible;
  dynamic displayOrder;
  dynamic sectionType;
  dynamic courseType;
  String? createdAt;
  String? updatedAt;

  Course({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.visible,
    this.courseType,
    this.displayOrder,
    this.sectionType,
    this.createdAt,
    this.updatedAt,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = json['level'];
    reason = json['reason'];
    purpose = json['purpose'];
    otherDetails = json['other_details'];
    defaultPrice = json['default_price'];
    coursePrice = json['course_price'];
    visible = json['visible'];
    courseType = json['courseType'];
    displayOrder = json['displayOrder'];
    sectionType = json['sectionType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
