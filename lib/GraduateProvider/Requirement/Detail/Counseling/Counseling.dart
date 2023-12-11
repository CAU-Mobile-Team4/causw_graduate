import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class Counseling extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '지도교수 상담';
  @override
  final String guideLine = '교내 학생생활 상담센터, 취업정보센터,\n성폭력상담실에서의 상담은 최대 2회까지 대체 가능';
}
