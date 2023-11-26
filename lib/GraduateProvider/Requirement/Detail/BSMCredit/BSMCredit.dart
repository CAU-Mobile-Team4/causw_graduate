import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class BSMCredit extends DetailCondition {
  @override
  int type = 1;
  @override
  String conditionName = 'BSM 학점';
  @override
  String guideLine = '테스트 가이드라인';
}
