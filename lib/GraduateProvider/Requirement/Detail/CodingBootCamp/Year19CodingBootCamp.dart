import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CodingBootCamp/CodingBootCamp.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19CodingBootCamp extends CodingBootCamp {
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
    for(Map<String, dynamic> subject in userData.subjects.major) {
      if(subject['name'] == '코딩부트캠프' && subject['isSatisfied'] == true) {
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
