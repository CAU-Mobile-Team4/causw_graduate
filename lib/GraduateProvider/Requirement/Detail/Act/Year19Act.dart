import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Act/Act.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Act extends Act {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    if(userData.additionalCondition.act['isSatisfied'] == true) {
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
