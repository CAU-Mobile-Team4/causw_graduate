import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class DesignCourseCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '설계 학점';
  @override
  final String guideLine = '창의적 설계 과목 필수\n창의적 설계 수강 이전(같은 학기는 허용)이나\n캡스톤디자인 수강 이후\n설계 과목은 미인정';
}
