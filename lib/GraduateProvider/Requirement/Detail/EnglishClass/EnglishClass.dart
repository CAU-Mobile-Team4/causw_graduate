import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class EnglishClass extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '영어 교양 또는 전공 영어강좌 2과목';
  @override
  final String guideLine = '다빈치교양대학에서 개설하는 영어교과목\n단, COMMUNICATION IN ENGLISH 제외\n전공 영어A 과목으로 대체';
}
