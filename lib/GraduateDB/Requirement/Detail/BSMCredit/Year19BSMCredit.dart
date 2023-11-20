import 'package:causw_graduate/GraduateDB/Requirement/Detail/BSMCredit/BSMCredit.dart';
import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';

class Year19BSMCredit extends BSMCredit {
  @override
  int require = 18;
  @override
  int satisfied = 0;

  @override
  void analysisGraduate() {
    UserData userData = UserData();
    int totalCredits = 0;
    for(Map<String, dynamic> map in userData.bsmSubjects.list) {
      if(map.containsKey('credits') && map['credits'] is num && map['isEnrolled'] == true) {
        totalCredits += map['credits'] as int;
      }
    }

    satisfied = totalCredits;
    if (satisfied >= require) {
      isSatisfied = true;
    }
  }
}
