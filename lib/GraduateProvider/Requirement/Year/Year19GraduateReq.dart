import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/Year19TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';

class Year19GraduateReq extends GraduateReq {
  Year19GraduateReq() {
    totalCredit = Year19TotalCredit();
    initializeList();
  }
}
