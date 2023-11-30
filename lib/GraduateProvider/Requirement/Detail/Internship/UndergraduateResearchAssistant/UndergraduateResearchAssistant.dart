import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class UndergraduateResearchAssistant extends DetailCondition {
  @override
  final int type = 3;
  @override
  final int groupId = 1;
  @override
  final int conditionGroupId = 1;
  @override
  final String conditionName = '학부 연구생';
  @override
  final String guideLine = '테스트 가이드라인';
}
