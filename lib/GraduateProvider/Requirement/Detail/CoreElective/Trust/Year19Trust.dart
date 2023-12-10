import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Trust/Trust.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Trust extends Trust {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int count = 0;
    for(Map<String, dynamic> subject in userData.subjects.coreElective['trust']) {
      if(subject['isSatisfied'] == true) {
        count++;
      }
    }

    satisfied = count;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
