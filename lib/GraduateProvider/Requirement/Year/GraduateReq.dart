import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class GraduateReq {
  late DetailCondition totalCredit;
  late DetailCondition majorCredit;
  late DetailCondition bsmCredit;
  late DetailCondition specializedElectiveCredit;

  List<DetailCondition> condition = [];

  void initializeList() {
    condition.add(totalCredit);
    condition.add(majorCredit);
    condition.add(bsmCredit);
    condition.add(specializedElectiveCredit);
  }
}
