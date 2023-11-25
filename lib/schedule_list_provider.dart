import 'package:causw_graduate/api_services.dart';
import 'package:causw_graduate/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleListProvider extends ChangeNotifier {
  List<Schedule> _scheduleListByDate = [];

  List<Schedule> get scheduleListByDate => _scheduleListByDate;

  Future<void> updateScheduleList(int studentId) async {
    _scheduleListByDate = await ApiService.getSchedules(studentId);
    notifyListeners();
  }

  Future<void> editScheduleList(Schedule schedule) async {
    bool result = await ApiService.editSchedule(schedule.scheduleId!, schedule);
    if (result) {
      print('수정 성공!');
    } else {
      print('수정 실패');
    }
    notifyListeners();
  }
}
