import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Thesis extends DetailCondition {
  @override
  final int type = 2;
  @override
  final String conditionName = '졸업논문';
  @override
  final String guideLine = '테스트 가이드라인';
}
