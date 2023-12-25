class UpdateRequest {
  String name;
  String country;
  String? phone;
  String birthday;
  String level;
  String studySchedule;
  List<String> learnTopics;
  List<String> testPreparations;
  UpdateRequest({
    required this.name,
    required this.country,
    required this.birthday,
    required this.level,
    required this.studySchedule,
    required this.learnTopics,
    required this.testPreparations,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'phone': phone,
      'birthday': birthday,
      'level': level,
      'learnTopics': learnTopics,
      'testPreparations': testPreparations,
      'studySchedule': studySchedule
    };
  }
}
