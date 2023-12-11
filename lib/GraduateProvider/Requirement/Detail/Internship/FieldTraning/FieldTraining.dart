import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class FieldTraining extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '현장 실습';
  @override
  final String guideLine = '방학에 실습\n4주(20일) 2학점\n8주(40일) 3학점';
}
