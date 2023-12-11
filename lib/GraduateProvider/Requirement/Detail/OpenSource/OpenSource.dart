import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

abstract class OpenSource extends DetailCondition {
  @override
  final int type = 1;
  @override
  final String conditionName = '오픈소스개발자 커뮤니티에 1건 이상 개방';
  @override
  final String guideLine = '';
}
