import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class HanjaClass extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '한자 수업 1회';
  @override
  final String guideLine = '한자 관련 강의 1과목 이수로 대체';
}
