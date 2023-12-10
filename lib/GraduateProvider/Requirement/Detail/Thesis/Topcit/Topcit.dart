import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Topcit extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = 'Topcit 시험 270점 이상';
  @override
  final String guideLine = '테스트 가이드라인';
}
