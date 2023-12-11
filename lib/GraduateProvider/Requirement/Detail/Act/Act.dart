import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Act extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = 'Act 교양 수강';
  @override
  final String guideLine = 'ACT 과목은 2학년 이상 수강 가능\n(팀플 과목)';
}
