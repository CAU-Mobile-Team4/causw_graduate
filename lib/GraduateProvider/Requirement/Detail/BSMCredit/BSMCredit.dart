import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class BSMCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = 'BSM 학점';
  @override
  final String guideLine = '전부 들어야 19학점이고\n실험과목은 필수라서\n전부 수강해야 만족';
}
