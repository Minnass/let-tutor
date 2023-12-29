class BookClassRequest {
  List<String> scheduleDetailIds;
  String note;
  BookClassRequest({required this.scheduleDetailIds, required this.note});
  Map<String, dynamic> toJson() {
    return {
      'scheduleDetailIds': scheduleDetailIds,
      'note': note,
    };
  }
}
