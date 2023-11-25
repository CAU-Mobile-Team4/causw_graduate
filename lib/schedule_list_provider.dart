import 'package:causw_graduate/api_services.dart';
import 'package:causw_graduate/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleListProvider extends ChangeNotifier {
  List<Schedule> _scheduleListByDate = [];

  List<Schedule> get scheduleListByDate => _scheduleListByDate;

  void updateScheduleList(int studentId) async {
    _scheduleListByDate = await ApiService.getSchedules(studentId);
    notifyListeners();
  }

  /*void updateScheduleListByDate(String month, String day) {
    _scheduleListByDate = _scheduleAllList
        .where((schedule) => schedule.month == month && schedule.day == day)
        .toList();
    notifyListeners();
  }*/
}
