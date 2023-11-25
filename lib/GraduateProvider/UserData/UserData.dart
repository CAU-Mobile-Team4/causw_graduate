import 'package:causw_graduate/GraduateProvider/UserData/Detail/StudentInfo.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class UserData {
  final List<UserDataDetail> _detailList = [];
  late StudentInfo _studentInfo;

  UserData() {
    _studentInfo = StudentInfo();
    _detailList.add(_studentInfo);
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
}
