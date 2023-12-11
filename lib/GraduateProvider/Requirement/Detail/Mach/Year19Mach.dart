import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Mach/Mach.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Mach extends Mach {
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
    for(Map<String, dynamic> subject in userData.subjects.specializedElective) {
      if(subject['isSatisfied'] == true && subject['isMach'] == true) {
        count++;
      }
    }
    userData.subjects.coreElective.forEach((key, value) {
      for(Map<String, dynamic> subject in value) {
        if(subject['isSatisfied'] == true && subject['isMach'] == true) {
          count++;
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
