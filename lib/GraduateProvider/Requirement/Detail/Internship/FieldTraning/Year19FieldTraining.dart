import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/FieldTraning/FieldTraining.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19FieldTraining extends FieldTraining {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    if (userData.additionalCondition.internship['fieldTraining'] == true) {
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
