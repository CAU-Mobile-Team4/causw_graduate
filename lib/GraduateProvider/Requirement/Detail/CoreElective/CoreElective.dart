import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class CoreElective extends DetailCondition {
  @override
  final int type = 2;
  @override
  final String conditionName = '핵심 교양';
  @override
  final String guideLine = '테스트 가이드라인';
}
