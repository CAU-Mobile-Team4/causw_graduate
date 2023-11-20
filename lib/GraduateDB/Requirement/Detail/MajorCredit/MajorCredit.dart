import 'package:causw_graduate/GraduateDB/Requirement/Detail/DetailCondition.dart';

abstract class MajorCredit extends DetailCondition {
  @override
  int type = 1;
  @override
  String conditionName = '공학 주제';
  @override
  String guideLine = '테스트 가이드라인';
}
