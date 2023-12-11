import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DesignCourseCredit/DesignCourseCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19DesignCourseCredit extends DesignCourseCredit {
  @override
  final int require = 12;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    bool isCreativityDesignSatisfied = false;
    int totalCredit = 0;
    for(Map<String, dynamic> subject in userData.subjects.designMajor) {
      if(subject['isSatisfied'] == true) {
        if(subject['name'] == '창의적 설계') {
          isCreativityDesignSatisfied = true;
        }
        totalCredit += subject['designCredit'] as int;
      }
    }

    if(isCreativityDesignSatisfied) {
      satisfied = totalCredit;
    } else {
      satisfied = 0;
    }

    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
