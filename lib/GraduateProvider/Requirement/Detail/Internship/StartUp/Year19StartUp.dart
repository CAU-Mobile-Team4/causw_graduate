import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/StartUp/StartUp.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19StartUp extends StartUp {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    if (userData.additionalCondition.internship['startUp'] == true) {
      satisfied = 1;
    } else {
      satisfied = 0;
    }

    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
