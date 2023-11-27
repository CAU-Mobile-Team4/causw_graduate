import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class StartUp extends DetailCondition {
  @override
  final int type = 3;
  @override
  final int groupId = 1;
  @override
  final int conditionGroupId = 1;
  @override
  final String conditionName = '창업 활동';
  @override
  final String guideLine = '테스트 가이드라인';
}