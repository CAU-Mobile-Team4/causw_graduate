import 'package:causw_graduate/GraduateDB/Requirement/Detail/DetailCondition.dart';

abstract class TotalCredit extends DetailCondition {
  @override
  int type = 1;
  @override
  String conditionName = '총 학점';
  @override
  String guideLine = '테스트 가이드라인';
}
