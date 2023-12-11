import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class CoreElective extends DetailCondition {
  @override
  final int type = 2;
  @override
  final String conditionName = '핵심 교양';
  @override
  final String guideLine = '분야 별로 1개씩 수강해야함\n일반 교양과 착각 주의';
}
