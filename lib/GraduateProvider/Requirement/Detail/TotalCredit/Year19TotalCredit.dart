import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19TotalCredit extends TotalCredit {
  @override
  final int admissionYear = 19;
  @override
  final String majorStatus = '주전공';
  @override
  final int require = 140;

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
    for(Map<String, dynamic> subject in userData.subjects.bsm) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.coreElective) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.specializedElective) {
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
