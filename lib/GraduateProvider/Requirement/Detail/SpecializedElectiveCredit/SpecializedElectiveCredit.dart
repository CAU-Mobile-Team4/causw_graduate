import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class SpecializedElectiveCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '전문교양 학점';
  @override
  final String guideLine = '타학과 동명 과목은 전문교양 미인정\n수강신청시 전문교양 확인\n잘못 수강시 과사무실 방문 후 행정처리';
}
