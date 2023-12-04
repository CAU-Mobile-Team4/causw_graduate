import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class CodingBootCamp extends DetailCondition {
  @override
  final int type = 1;
  @override
  final int groupId = 0;
  @override
  final int conditionGroupId = 0;
  @override
  final String conditionName = '코딩부트캠프 통과';
  @override
  final String guideLine = '테스트 가이드라인';
}
