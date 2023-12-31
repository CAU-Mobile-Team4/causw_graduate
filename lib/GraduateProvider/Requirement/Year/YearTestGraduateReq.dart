import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Act/Year19Act.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/BSMCredit/Year19BSMCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Capstone/Year19Capstone.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CodingBootCamp/Year19CodingBootCamp.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Year19CoreElective.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Counseling/Year19Counseling.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DesignCourseCredit/Year19DesignCourseCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/Year19English.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/EnglishClass/Year19EnglishClass.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Hanja/Year19Hanja.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/Year19Internship.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Mach/Year19Mach.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MajorCredit/Year19MajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/MinGrade/Year19MinGrade.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/NotApplicateCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/OpenSource/Year19OpenSource.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/RequiredMajor/Year19RequiredMajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/SpecializedElectiveCredit/Year19SpecializedElectiveCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Thesis/Year19Thesis.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/Year19TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';

class YearTestGraduateReq extends GraduateReq {
  @override
  String studentInfo = '테스트';

  YearTestGraduateReq() {
    totalCredit = Year19TotalCredit();
    minGrade = NotApplicateCondition();
    majorCredit = NotApplicateCondition();
    requiredMajor = NotApplicateCondition();
    designCourseCredit = NotApplicateCondition();
    bsmCredit = NotApplicateCondition();
    specializedElectiveCredit = NotApplicateCondition();
    counseling = NotApplicateCondition();
    internship = NotApplicateCondition();
    capstone = NotApplicateCondition();
    thesis = NotApplicateCondition();
    hanja = NotApplicateCondition();
    codingBootCamp = NotApplicateCondition();
    coreElective = NotApplicateCondition();
    mach = NotApplicateCondition();
    act = NotApplicateCondition();
    openSource = NotApplicateCondition();
    english = NotApplicateCondition();
    englishClass = NotApplicateCondition();
    initializeList();
  }
}
