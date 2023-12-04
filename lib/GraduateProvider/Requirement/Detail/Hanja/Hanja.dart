import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Hanja extends DetailCondition {
  @override
  final int type = 2;
  @override
  final int groupId = 2;
  @override
  final int conditionGroupId = 0;
  @override
  final String conditionName = '한자';
  @override
  final String guideLine = '테스트 가이드라인';
}
