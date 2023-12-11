import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class EnglishTest extends DetailCondition {
  @override
  final int type = 3;
  @override
  final String conditionName = '토익 750 이상 or 토익스피킹 5급 이상';
  @override
  final String guideLine = '';
}
