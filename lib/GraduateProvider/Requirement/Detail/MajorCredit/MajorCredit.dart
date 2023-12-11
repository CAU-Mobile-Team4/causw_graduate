import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class MajorCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '공학주제 학점';
  @override
  final String guideLine = '전공과 bsm을 제외한 기초전공\n수강신청할때 공학주제라고 붙었는지 확인\n타학과 과목 주의';
}
