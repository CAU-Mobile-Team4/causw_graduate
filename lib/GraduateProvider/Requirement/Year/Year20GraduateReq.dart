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
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/OpenSource/Year19OpenSource.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/RequiredMajor/Year19RequiredMajorCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/SpecializedElectiveCredit/Year19SpecializedElectiveCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Thesis/Year19Thesis.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/TotalCredit/Year19TotalCredit.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';

class Year20GraduateReq extends GraduateReq {
  Year20GraduateReq() {
    totalCredit = Year19TotalCredit();
    minGrade = Year19MinGrade();
    majorCredit = Year19MajorCredit();
    requiredMajor = Year19RequiredMajorCredit();
    designCourseCredit = Year19DesignCourseCredit();
    bsmCredit = Year19BSMCredit();
    specializedElectiveCredit = Year19SpecializedElectiveCredit();
    counseling = Year19Counseling();
    internship = Year19Internship();
    capstone = Year19Capstone();
    thesis = Year19Thesis();
    hanja = Year19Hanja();
    codingBootCamp = Year19CodingBootCamp();
    coreElective = Year19CoreElective();
    mach = Year19Mach();
    act = Year19Act();
    openSource = Year19OpenSource();
    english = Year19English();
    englishClass = Year19EnglishClass();
    initializeList();
  }
}
