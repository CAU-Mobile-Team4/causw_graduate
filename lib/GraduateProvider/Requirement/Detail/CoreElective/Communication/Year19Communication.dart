import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Communication/Communication.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Communication extends Communication {
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
    for(Map<String, dynamic> subject in userData.subjects.coreElective['communication']) {
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
