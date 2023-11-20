import 'package:causw_graduate/GraduateDB/UserData/Detail/BSMSubjects.dart';
import 'package:causw_graduate/GraduateDB/UserData/Detail/CoreElectiveSubjects.dart';
import 'package:causw_graduate/GraduateDB/UserData/Detail/MajorSubjects.dart';
import 'package:causw_graduate/GraduateDB/UserData/Detail/SpecializedElectiveSubjects.dart';
import 'package:causw_graduate/GraduateDB/UserData/Detail/StudentInfo.dart';

class UserData {
  static final UserData _instance = UserData._internal();

  StudentInfo studentInfo = StudentInfo();
  MajorSubjects majorSubjects = MajorSubjects();
  BSMSubjects bsmSubjects = BSMSubjects();
  SpecializedElectiveSubjects specializedElectiveSubjects = SpecializedElectiveSubjects();
  CoreElectiveSubjects coreElectiveSubjects = CoreElectiveSubjects();

  factory UserData() {
    return _instance;
  }

  UserData._internal() {
    majorSubjects.loadData();
  }

  Future<void> initialize() async {
    await studentInfo.loadData();
    await majorSubjects.loadData();
    await bsmSubjects.loadData();
    await specializedElectiveSubjects.loadData();
    await coreElectiveSubjects.loadData();
  }
}
