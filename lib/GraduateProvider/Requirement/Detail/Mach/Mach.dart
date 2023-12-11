import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Mach extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = 'MACH 교양 수강';
  @override
  final String guideLine = 'MACH 교양 목록\n공통교양: AI시대문제해결을위한디자인사고\n핵심-도전: 트렌드를읽는데이터경영\n핵심-창의: 디지털시대와공감\n'
      '핵심-융합: 디지털게임과문화\n핵심-신뢰: 발견,발명,그위대한상상\n핵심-소통: 위험사회의웰빙사이언스';
}
