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
    updateScheduleList(1);
  }

  Future<void> deleteScheduleList(int scheduleId) async {
    bool result = await ApiService.deleteSchedules(1, scheduleId);
    if (result) {
      print('삭제 성공!');
    } else {
      print('삭제 실패');
    }
    updateScheduleList(1);
  }

  Future<void> addScheduleList(Schedule schedule) async {
    bool result = await ApiService.addSchedule(1, schedule);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }
    updateScheduleList(1);
  }

  Future<void> addScheduleListByNlp(String statement) async {
    bool result = await ApiService.addScheduleByNlp(1, statement);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }
    updateScheduleList(1);
  }
}
