import 'package:flutter/material.dart';
import 'package:lettutor/models/schedule/schedule.dart';

class ScheduleProvider extends ChangeNotifier {
  List<Schedule> schedules = [];
  void addSchedule(Schedule schedule) {
    schedules.add(schedule);
    notifyListeners();
  }
}
