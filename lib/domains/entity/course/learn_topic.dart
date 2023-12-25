class LearnTopic {
  int? id;
  String? key;
  String? name;

  LearnTopic({this.id, this.key, this.name});
  static LearnTopic? getNew(String id) {
    if (id == '3') {
      return LearnTopic(
          id: 3, key: 'english-for-kids', name: 'English for Kids');
    } else if (id == '4') {
      return LearnTopic(
          id: 4, key: 'business-english', name: 'Business English');
    } else if (id == '5') {
      return LearnTopic(
          id: 5, key: 'conversational-english', name: 'Conversational English');
    }
    return null;
  }

  LearnTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }
}
