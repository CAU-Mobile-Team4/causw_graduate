import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class SpecializedElectiveCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final int groupId = 0;
  @override
  final int conditionGroupId = 0;
  @override
  final String conditionName = '전문교양 학점';
  @override
  final String guideLine = '테스트 가이드라인';
}
