import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/English.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/EnglishMajorClass/Year19EnglishMajorClass.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/EnglishTest/Year19EnglishTest.dart';

class Year19English extends English {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  late DetailCondition englishTest;
  late DetailCondition englishMajorClass;

  Year19English() {
    englishTest = Year19EnglishTest();
    subCondition.add(englishTest);
    englishMajorClass = Year19EnglishMajorClass();
    subCondition.add(englishMajorClass);
  }

  @override
  void analysisUpdate() {
    int count = 0;
    for(DetailCondition condition in subCondition) {
      condition.analysisUpdate();
      if(condition.isSatisfied) {
        count++;
      }
    }

    satisfied = count;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
