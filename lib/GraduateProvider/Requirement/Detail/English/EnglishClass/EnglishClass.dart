import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class EnglishClass extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '전공 영어 강좌 3개 이상';
  @override
  final String guideLine = '테스트 가이드라인';
}
