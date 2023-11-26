import 'package:causw_graduate/GraduateProvider/UserData/Detail/AdditionalCondition.dart';
import 'package:causw_graduate/GraduateProvider/UserData/Detail/StudentInfo.dart';
import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class UserData {
  static final UserData _userData = UserData._internal();

  final List<UserDataDetail> _detailList = [];
  late StudentInfo _studentInfo;
  late Subjects _subjects;
  late AdditionalCondition _additionalCondition;

  UserData._internal() {
    _studentInfo = StudentInfo();
    _subjects = Subjects();
    _additionalCondition = AdditionalCondition();

    _detailList.add(_studentInfo);
    _detailList.add(_subjects);
    _detailList.add(_additionalCondition);
  }

  factory UserData() {
    return _userData;
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
  AdditionalCondition get additionalCondition => _additionalCondition;
}
