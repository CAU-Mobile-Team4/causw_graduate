import 'package:causw_graduate/GraduateDB/UserData/Detail/MajorSubjects.dart';
import 'package:causw_graduate/GraduateDB/UserData/Detail/StudentInfo.dart';

class UserData {
  static final UserData _instance = UserData._internal();

  StudentInfo studentInfo = StudentInfo();
  MajorSubjects majorSubjects = MajorSubjects();

  factory UserData() {
    return _instance;
  }

  UserData._internal();
}
