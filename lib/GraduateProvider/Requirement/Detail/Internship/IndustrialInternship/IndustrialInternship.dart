import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class IndustrialInternship extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '산업체 인턴쉽';
  @override
  final String guideLine = '테스트 가이드라인';
}
