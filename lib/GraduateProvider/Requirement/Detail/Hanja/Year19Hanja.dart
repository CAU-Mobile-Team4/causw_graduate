import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Hanja/Hanja.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Hanja/HanjaClass/Year19HanjaClass.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Hanja/HanjaTest/Year19HanjaTest.dart';

class Year19Hanja extends Hanja {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  late DetailCondition hanjaTest;
  late DetailCondition hanjaClass;

  @override
  void analysisUpdate() {
    hanjaTest = Year19HanjaTest();
    subCondition.add(hanjaTest);
    hanjaClass = Year19HanjaClass();
    subCondition.add(hanjaClass);

    int hanjaCount = 0;
    for(DetailCondition condition in subCondition) {
      if(condition.isSatisfied) {
        hanjaCount++;
      }
    }

    satisfied = hanjaCount;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
