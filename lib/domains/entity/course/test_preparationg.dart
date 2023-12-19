class TestPreparation {
  int? id;
  String? key;
  String? name;

  TestPreparation({this.id, this.key, this.name});

  TestPreparation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }
}
