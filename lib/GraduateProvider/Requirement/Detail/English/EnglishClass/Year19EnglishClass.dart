import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/EnglishClass/EnglishClass.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19EnglishClass extends EnglishClass {
  @override
  final int require = 3;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int count = 0;
    for(Map<String, dynamic> subject in userData.subjects.major) {
      if(subject['isSatisfied'] == true && subject['english'] == 'english') {
        count++;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.designMajor) {
      if(subject['isSatisfied'] == true && subject['english'] == 'english') {
        count++;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.nonSWStudentMajor) {
      if(subject['isSatisfied'] == true && subject['english'] == 'english') {
        count++;
      }
    }
    for(Map<String, dynamic> subject in userData.subjects.bsm) {
      if(subject['isSatisfied'] == true && subject['english'] == 'english') {
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
