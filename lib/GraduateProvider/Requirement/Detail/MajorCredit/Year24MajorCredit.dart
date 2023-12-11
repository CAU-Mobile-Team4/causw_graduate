import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MajorCredit/MajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year24MajorCredit extends MajorCredit {
  @override
  final int require = 72;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int totalCredit = 0;
    for(Map<String, dynamic> subject in userData.subjects.major) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.designMajor) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }

    satisfied = totalCredit;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
