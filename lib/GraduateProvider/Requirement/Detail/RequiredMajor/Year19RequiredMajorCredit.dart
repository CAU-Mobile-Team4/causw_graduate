import 'package:causw_graduate/GraduateProvider/Requirement/Detail/RequiredMajor/RequiredMajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19RequiredMajorCredit extends RequiredMajorCredit {
  @override
  final int require = 6;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int requiredMajorCount = 0;
    for(Map<String, dynamic> subject in userData.subjects.major) {
      if(subject['isSatisfied'] == true && subject['isRequired'] == true) {
        requiredMajorCount++;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.designMajor) {
      if(subject['isSatisfied'] == true && subject['isRequired'] == true) {
        requiredMajorCount++;
      }
    }

    satisfied = requiredMajorCount;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
