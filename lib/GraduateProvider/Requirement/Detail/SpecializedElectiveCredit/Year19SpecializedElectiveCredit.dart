import 'package:causw_graduate/GraduateProvider/Requirement/Detail/SpecializedElectiveCredit/SpecializedElectiveCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19SpecializedElectiveCredit extends SpecializedElectiveCredit {
  @override
  final int require = 6;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int totalCredit = 0;
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
