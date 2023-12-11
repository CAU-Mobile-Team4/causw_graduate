import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class EnglishMajorClass extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '전공 영어 강좌 3개 이상';
  @override
  final String guideLine = '전공 영어A 과목 수강으로 대체';
}
