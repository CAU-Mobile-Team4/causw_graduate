import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class RequiredMajorCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final int groupId = 0;
  @override
  final int conditionGroupId = 0;
  @override
  final String conditionName = '필수 전공 과목';
  @override
  final String guideLine = '테스트 가이드라인';
}
