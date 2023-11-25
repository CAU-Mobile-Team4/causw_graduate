import 'package:causw_graduate/GraduateProvider/UserData/Detail/StudentInfo.dart';
import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class UserData {
  final List<UserDataDetail> _detailList = [];
  late StudentInfo _studentInfo;
  late Subjects _subjects;

  UserData() {
    _studentInfo = StudentInfo();
    _subjects = Subjects();

    _detailList.add(_studentInfo);
    _detailList.add(_subjects);
  }

  Future<void> loadDataAll() async {
    await Future.wait(_detailList.map((userDataDetail) => userDataDetail.loadData()));
  }

  Future<void> saveDataAll() async {
    for(UserDataDetail userDataDetail in _detailList) {
      await userDataDetail.saveData();
    }
  }

  StudentInfo get studentInfo => _studentInfo;
  Subjects get subjects => _subjects;
}
