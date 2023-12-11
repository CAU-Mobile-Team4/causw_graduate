import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Hanja extends DetailCondition {
  @override
  final int type = 2;
  @override
  final String conditionName = '한자';
  @override
  final String guideLine = '';
}
