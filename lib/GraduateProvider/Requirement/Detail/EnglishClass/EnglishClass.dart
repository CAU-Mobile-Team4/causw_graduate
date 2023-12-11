import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class EnglishClass extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '영어 교양 또는 전공 영어강좌 2과목';
  @override
  final String guideLine = '테스트 가이드라인';
}
