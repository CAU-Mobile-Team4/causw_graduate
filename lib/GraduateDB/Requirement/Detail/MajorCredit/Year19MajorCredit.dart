import 'package:causw_graduate/GraduateDB/Requirement/Detail/MajorCredit/MajorCredit.dart';
import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';

class Year19MajorCredit extends MajorCredit {
  @override
  int require = 84;
  @override
  int satisfied = 0;

  @override
  void analysisGraduate() {
    UserData userData = UserData();
    int totalCredits = 0;
    for(Map<String, dynamic> map in userData.majorSubjects.list) {
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
