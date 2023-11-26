import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/TotalCredit.dart';

abstract class GraduateReq {
  late TotalCredit totalCredit;

  List<DetailCondition> condition = [];

  void initializeList() {
    condition.add(totalCredit);
  }
}
