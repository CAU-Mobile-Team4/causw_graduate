import 'package:causw_graduate/GraduateProvider/Requirement/Detail/BSMCredit/Year19BSMCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MajorCredit/Year19MajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/Year19TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';

class Year19GraduateReq extends GraduateReq {
  Year19GraduateReq() {
    totalCredit = Year19TotalCredit();
    majorCredit = Year19MajorCredit();
    bsmCredit = Year19BSMCredit();
    initializeList();
  }
}
