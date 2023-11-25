import 'package:causw_graduate/GraduateProvider/UserData/Detail/StudentInfo.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';
import 'package:flutter/material.dart';

class UserDataProvider with ChangeNotifier {
  final List<UserDataDetail> _detailList = [];
  final UserDataDetail _studentInfo = StudentInfo();

  UserDataProvider() {
    _detailList.add(_studentInfo);
    _loadDataAll();
  }

  Future<void> _loadDataAll() async {
    await Future.wait(_detailList.map((userDataDetail) => userDataDetail.loadData()));
    notifyListeners();
  }

  Future<void> saveDataAll() async {
    for(UserDataDetail userDataDetail in _detailList) {
      await userDataDetail.saveData();
    }
  }

  UserDataDetail get studentInfo => _studentInfo;
}
