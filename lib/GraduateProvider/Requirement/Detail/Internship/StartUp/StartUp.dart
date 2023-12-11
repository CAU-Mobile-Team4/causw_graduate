import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class StartUp extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '창업 활동';
  @override
  final String guideLine = '';
}
