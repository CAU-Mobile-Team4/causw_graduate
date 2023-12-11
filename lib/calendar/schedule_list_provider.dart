import 'package:causw_graduate/calendar/api_services.dart';
import 'package:causw_graduate/calendar/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleListProvider extends ChangeNotifier {
  List<Schedule> _scheduleListByDate = [];
  List<Schedule> get scheduleListByDate => _scheduleListByDate;

  void editSchedule(Schedule schedule) {}

  Future<void> updateScheduleList(int studentId) async {
    _scheduleListByDate = await ApiService.getSchedules(studentId);
    notifyListeners();
  }

  Future<void> editScheduleList(int stuID, Schedule schedule) async {
    bool result = await ApiService.editSchedule(schedule.scheduleId!, schedule);
    if (result) {
      print('수정 성공!');
    } else {
      print('수정 실패');
    }
    /*_scheduleListByDate
        .removeWhere((element) => element.scheduleId == schedule.scheduleId);
    _scheduleListByDate.add(schedule);

    notifyListeners();*/
    updateScheduleList(stuID);
  }

  Future<void> deleteScheduleList(int stuID, int schID) async {
    bool result = await ApiService.deleteSchedules(1, schID);
    if (result) {
      print('삭제 성공!');
    } else {
      print('삭제 실패');
    }
    /*_scheduleListByDate
        .removeWhere((element) => element.scheduleId == scheduleId);

    notifyListeners();*/
    updateScheduleList(stuID);
  }

  Future<void> addScheduleList(int stuID, Schedule schedule) async {
    bool result = await ApiService.addSchedule(stuID, schedule);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }
    _scheduleListByDate.add(schedule);
    updateScheduleList(stuID);
    notifyListeners();
  }

  Future<void> addScheduleListByNlp(int stuID, String statement) async {
    bool result = await ApiService.addScheduleByNlp(stuID, statement);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }
    updateScheduleList(stuID);

    notifyListeners();
  }
}
