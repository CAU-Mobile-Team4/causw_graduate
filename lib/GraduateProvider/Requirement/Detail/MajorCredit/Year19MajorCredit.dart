import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MajorCredit/MajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19MajorCredit extends MajorCredit {
  @override
  final int require = 84;

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

    satisfied = totalCredit;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
