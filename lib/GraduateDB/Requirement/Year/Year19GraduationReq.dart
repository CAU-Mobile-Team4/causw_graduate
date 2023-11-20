import 'package:causw_graduate/GraduateDB/Requirement/Detail/MajorCredit/Year19MajorCredit.dart';
import 'package:causw_graduate/GraduateDB/Requirement/Detail/TotalCredit/Year19TotalCredit.dart';
import 'package:causw_graduate/GraduateDB/Requirement/Year/GraduationReq.dart';

class Year19GraduationReq extends GraduationReq {
  Year19GraduationReq() {
    list.add(Year19TotalCredit());
    list.add(Year19MajorCredit());
  }
}
