import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class IndustrialInternship extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '산업체 인턴쉽';
  @override
  final String guideLine = '산업체 인턴쉽 수행시\n캡스톤 1회 대체\n12주(60일) 이상 12학점\n15주(75일) 이상 15학점\n휴학하지 않고 수행해야하며\n휴학하고 15주 수행시\n현장실습으로 4학점';
}
