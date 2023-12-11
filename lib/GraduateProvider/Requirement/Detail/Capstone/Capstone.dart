import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Capstone extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '캡스톤 2회';
  @override
  final String guideLine = '산업체인턴쉽을 했을 경우 1회 대체';
}
