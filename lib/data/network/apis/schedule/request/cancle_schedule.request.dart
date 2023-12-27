class CancleScheduleRequest {
  List<String> scheduleDetailIds;

  CancleScheduleRequest({required this.scheduleDetailIds});
  Map<String, dynamic> toJson() {
    return {
      'scheduleDetailIds': scheduleDetailIds,
    };
  }
}
