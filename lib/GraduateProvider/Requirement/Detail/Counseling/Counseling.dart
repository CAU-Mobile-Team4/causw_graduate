import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Counseling extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '지도교수 상담';
  @override
  final String guideLine = '테스트 가이드라인';
}
