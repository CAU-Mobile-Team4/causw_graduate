import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class HanjaClass extends DetailCondition {
  @override
  final int type = 3;
  @override
  final int groupId = 2;
  @override
  final int conditionGroupId = 2;
  @override
  final String conditionName = '한자 수업 1회';
  @override
  final String guideLine = '테스트 가이드라인';
}
