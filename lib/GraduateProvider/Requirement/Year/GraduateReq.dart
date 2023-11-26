import 'package:causw_graduate/GraduateProvider/Requirement/Detail/BSMCredit/BSMCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MajorCredit/MajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/SpecializedElectiveCredit/SpecializedElectiveCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/TotalCredit.dart';

abstract class GraduateReq {
  late TotalCredit totalCredit;
  late MajorCredit majorCredit;
  late BSMCredit bsmCredit;
  late SpecializedElectiveCredit specializedElectiveCredit;

  List<DetailCondition> condition = [];

  void initializeList() {
    condition.add(totalCredit);
    condition.add(majorCredit);
    condition.add(bsmCredit);
    condition.add(specializedElectiveCredit);
  }
}
