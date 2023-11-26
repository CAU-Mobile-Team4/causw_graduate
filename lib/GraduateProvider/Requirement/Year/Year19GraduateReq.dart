import 'package:causw_graduate/GraduateProvider/Requirement/Detail/BSMCredit/Year19BSMCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Counseling/Year19Counseling.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DesignCourseCredit/Year19DesignCourseCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MajorCredit/Year19MajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/RequiredMajor/Year19RequiredMajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/SpecializedElectiveCredit/Year19SpecializedElectiveCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/Year19TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';

class Year19GraduateReq extends GraduateReq {
  Year19GraduateReq() {
    totalCredit = Year19TotalCredit();
    majorCredit = Year19MajorCredit();
    requiredMajor = Year19RequiredMajorCredit();
    designCourseCredit = Year19DesignCourseCredit();
    bsmCredit = Year19BSMCredit();
    specializedElectiveCredit = Year19SpecializedElectiveCredit();
    counseling = Year19Counseling();
    initializeList();
  }
}
