import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class SpecializedElectiveCredit extends DetailCondition {
  @override
  int type = 1;
  @override
  String conditionName = '전문교양 학점';
  @override
  String guideLine = '테스트 가이드라인';
}
