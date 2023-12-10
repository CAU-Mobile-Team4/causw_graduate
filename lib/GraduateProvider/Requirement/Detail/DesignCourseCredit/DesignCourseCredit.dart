import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class DesignCourseCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '설계 학점';
  @override
  final String guideLine = '테스트 가이드라인';
}
