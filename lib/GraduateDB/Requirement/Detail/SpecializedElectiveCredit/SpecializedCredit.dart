import 'package:causw_graduate/GraduateDB/Requirement/Detail/DetailCondition.dart';

abstract class SpecializedCredit extends DetailCondition {
  @override
  int type = 1;
  @override
  String conditionName = '전문 교양';
  @override
  String guideLine = '테스트 가이드라인';
}
