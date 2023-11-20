import 'package:causw_graduate/GraduateDB/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateDB/Requirement/GraduateAnalysis.dart';
import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('SharedPreferences Test', () async {
    SharedPreferences.setMockInitialValues({});

    UserData userData = UserData();
    await userData.loadDataAll();
    print(userData.majorSubjects.list);

    userData.studentInfo.admissionYear = 19;
    userData.studentInfo.majorStatus = '주전공';
    await userData.studentInfo.saveData();

    GraduateAnalysis graduateAnalysis = GraduateAnalysis();

    for(DetailCondition condition in graduateAnalysis.getGraduationAnalysis()) {
      print(condition.type);
      print(condition.conditionName);
      print(condition.guideLine);
      print(condition.require);
      print(condition.satisfied);
      print(condition.isSatisfied);
      print("");
    }
  });
}
