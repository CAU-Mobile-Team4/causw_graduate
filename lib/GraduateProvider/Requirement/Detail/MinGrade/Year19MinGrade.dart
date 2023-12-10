import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MinGrade/MinGrade.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19MinGrade extends MinGrade {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    double grade = userData.additionalCondition.grade['score'];
    if(grade >= 2.2) {
      satisfied = 1;
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
