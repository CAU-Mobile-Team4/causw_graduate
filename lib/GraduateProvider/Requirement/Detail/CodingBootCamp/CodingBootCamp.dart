import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class CodingBootCamp extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '코딩부트캠프 통과';
  @override
  final String guideLine = '3학년 2학기 과목\n여러번의 거쳐서 점점 난이도가 내려가는\n 코딩 테스트를 보며\n통과할 경우 pass\n전부 떨어지면 fail';
}
