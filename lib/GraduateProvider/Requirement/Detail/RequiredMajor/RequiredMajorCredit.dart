import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class RequiredMajorCredit extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '필수 전공 과목';
  @override
  final String guideLine = '자료구조,컴퓨터구조,알고리즘\n운영체제,프로그래밍언어론,소프트웨어공학';
}
