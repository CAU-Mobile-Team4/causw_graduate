import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Communication extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '핵심-소통 교양 1회';
  @override
  final String guideLine = '';
}
