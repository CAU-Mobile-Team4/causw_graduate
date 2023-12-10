import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Act extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = 'Act 교양 수강';
  @override
  final String guideLine = '테스트 가이드라인';
}
