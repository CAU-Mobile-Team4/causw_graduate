import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class HanjaTest extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '한자능력 검정시험 4급 이상';
  @override
  final String guideLine = '테스트 가이드라인';
}
