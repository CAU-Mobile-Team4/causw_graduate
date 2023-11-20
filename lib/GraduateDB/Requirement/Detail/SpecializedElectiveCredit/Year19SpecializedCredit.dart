import 'package:causw_graduate/GraduateDB/Requirement/Detail/SpecializedElectiveCredit/SpecializedCredit.dart';
import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';

class Year19SpecializedCredit extends SpecializedCredit {
  @override
  int require = 6;
  @override
  int satisfied = 0;

  @override
  void analysisGraduate() {
    UserData userData = UserData();
    int totalCredits = 0;
    for(Map<String, dynamic> map in userData.specializedElectiveSubjects.list) {
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
