import 'package:causw_graduate/GraduateProvider/Requirement/Detail/EnglishClass/EnglishClass.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19EnglishClass extends EnglishClass {
  @override
  final int require = 2;

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

    userData.subjects.coreElective.forEach((key, value) {
      for(Map<String, dynamic> subject in value) {
        if(subject['isSatisfied'] == true) {
          if(subject['name'] == 'English for Professional Track(Arts,Sports)') {
            count++;
          } else if(subject['name'] == 'English for Professional Track(Business, Economics)') {
            count++;
          } else if(subject['name'] == 'English for Professional Track(Sciences, Engineering)') {
            count++;
          } else if(subject['name'] == 'English for Professional Track(Social, Humanities)') {
            count++;
          }
        }
      }
    });

    satisfied = count;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
