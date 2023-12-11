import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class DefaultThesis extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '졸업 논문 제출';
  @override
  final String guideLine = '지도교수 포함 전임교원 2인 심사 통과\n대부분 topcit으로 대체';
}
