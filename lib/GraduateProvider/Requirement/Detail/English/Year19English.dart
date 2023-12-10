import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/English.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/EnglishClass/Year19EnglishClass.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/English/EnglishTest/Year19EnglishTest.dart';

class Year19English extends English {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  late DetailCondition englishTest;
  late DetailCondition englishClass;

  Year19English() {
    englishTest = Year19EnglishTest();
    subCondition.add(englishTest);
    englishClass = Year19EnglishClass();
    subCondition.add(englishClass);
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
