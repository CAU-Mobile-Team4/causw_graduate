import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class DefaultThesis extends DetailCondition {
  @override
  final int type = 3;
  @override
  final int groupId = 3;
  @override
  final int conditionGroupId = 3;
  @override
  final String conditionName = '졸업 논문 제출';
  @override
  final String guideLine = '테스트 가이드라인';
}
