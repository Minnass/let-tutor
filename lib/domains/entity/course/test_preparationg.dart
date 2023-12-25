class TestPreparation {
  int? id;
  String? key;
  String? name;

  TestPreparation({this.id, this.key, this.name});
  static TestPreparation? getNew(String id) {
    if (id == '1') {
      return TestPreparation(id: 1, key: 'starters', name: 'STARTERS');
    } else if (id == '2') {
      return TestPreparation(id: 2, key: 'movers', name: 'MOVERS');
    } else if (id == '3') {
      return TestPreparation(id: 3, key: 'flyers', name: 'FLYERS');
    } else if (id == '4') {
      return TestPreparation(id: 4, key: 'ket', name: 'KET');
    } else if (id == '5') {
      return TestPreparation(id: 5, key: 'pet', name: 'PET');
    } else if (id == '6') {
      return TestPreparation(id: 6, key: 'ielts', name: 'IELTS');
    } else if (id == '7') {
      return TestPreparation(id: 7, key: 'toefl', name: 'TOEFL');
    } else if (id == '8') {
      return TestPreparation(id: 8, key: 'toeic', name: 'TOEIC');
    }
    return null;
  }

  TestPreparation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }
}
