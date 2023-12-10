import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Thesis/DefaultThesis/Year19DefaultThesis.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Thesis/Thesis.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Thesis/Topcit/Year19Topcit.dart';

class Year19Thesis extends Thesis {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  late DetailCondition defaultThesis;
  late DetailCondition topcit;

  Year19Thesis() {
    defaultThesis = Year19DefaultThesis();
    subCondition.add(defaultThesis);
    topcit = Year19Topcit();
    subCondition.add(topcit);
  }

  @override
  void analysisUpdate() {
    int thesiscount = 0;
    for(DetailCondition condition in subCondition) {
      condition.analysisUpdate();
      if(condition.isSatisfied) {
        thesiscount++;
      }
    }

    satisfied = thesiscount;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
