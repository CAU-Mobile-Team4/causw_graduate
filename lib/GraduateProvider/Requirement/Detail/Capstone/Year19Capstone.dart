import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Capstone/Capstone.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Capstone extends Capstone {
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
    for(Map<String, dynamic> subject in userData.subjects.designMajor) {
      if((subject['name'] == '캡스톤디자인(1)' || subject['name'] == '캡스톤디자인(2)') && subject['isSatisfied'] == true) {
        count++;
      }
    }

    if(count < 2 && userData.additionalCondition.internship['industrialInternship']) {
      count++;
    }

    satisfied = count;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
