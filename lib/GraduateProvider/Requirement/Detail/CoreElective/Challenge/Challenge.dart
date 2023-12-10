import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Challenge extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '핵심-도전 교양 1회';
  @override
  final String guideLine = '테스트 가이드라인';
}
