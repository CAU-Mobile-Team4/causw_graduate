import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class GraduateReq {
  late DetailCondition totalCredit;
  late DetailCondition majorCredit;
  late DetailCondition requiredMajor;
  late DetailCondition designCourseCredit;
  late DetailCondition bsmCredit;
  late DetailCondition specializedElectiveCredit;
  late DetailCondition counseling;
  late DetailCondition internship;
  late DetailCondition capstone;
  late DetailCondition thesis;
  late DetailCondition hanja;
  late DetailCondition codingBootCamp;
  late DetailCondition coreElective;

  List<DetailCondition> condition = [];

  void initializeList() {
    condition.add(totalCredit);
    condition.add(majorCredit);
    condition.add(requiredMajor);
    condition.add(designCourseCredit);
    condition.add(bsmCredit);
    condition.add(specializedElectiveCredit);
    condition.add(counseling);
    condition.add(internship);
    condition.add(capstone);
    condition.add(thesis);
    condition.add(hanja);
    condition.add(codingBootCamp);
    condition.add(coreElective);
  }
}
