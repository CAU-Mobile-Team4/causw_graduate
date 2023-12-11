import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class MinGrade extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '최저 졸업평점 2.2 이상';
  @override
  final String guideLine = '평균 C+ 기준 2.5\n평균 C 기준 2.0';
}
