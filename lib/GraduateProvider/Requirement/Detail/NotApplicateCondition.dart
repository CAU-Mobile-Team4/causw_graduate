import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

class NotApplicateCondition extends DetailCondition {
  @override
  final int type = 0;
  @override
  final String conditionName = '미적용';
  @override
  final String guideLine = '';

  @override
  final int require = 0;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate(){}
}
