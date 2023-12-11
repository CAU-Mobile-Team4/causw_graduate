import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19TotalCredit extends TotalCredit {
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
    for(Map<String, dynamic> subject in userData.subjects.designMajor) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.nonSWStudentMajor) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.bsm) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.specializedElective) {
      if(subject['isSatisfied'] == true) {
        totalCredit += subject['credits'] as int;
      }
    }
    userData.subjects.coreElective.forEach((key, value) {
      for(Map<String, dynamic> subject in value) {
        if(subject['isSatisfied'] == true) {
          totalCredit += subject['credits'] as int;
        }
      }
    });
    userData.additionalCondition.additionalCredit.forEach((key, value) {
      totalCredit += value as int;
    });

    satisfied = totalCredit;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
