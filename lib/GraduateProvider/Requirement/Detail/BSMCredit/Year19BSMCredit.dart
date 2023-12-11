import 'package:causw_graduate/GraduateProvider/Requirement/Detail/BSMCredit/BSMCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19BSMCredit extends BSMCredit {
  @override
  final int require = 18;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int totalCredit = 0;
    for(Map<String, dynamic> subject in userData.subjects.bsm) {
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
