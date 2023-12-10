import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Challenge/Year19Challenge.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Communication/Year19Communication.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/CoreElective.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Creativity/Year19Creativity.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Fusion/Year19Fusion.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/CoreElective/Trust/Year19Trust.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

class Year19CoreElective extends CoreElective {
  @override
  final int require = 5;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  late DetailCondition challenge;
  late DetailCondition creativity;
  late DetailCondition fusion;
  late DetailCondition trust;
  late DetailCondition communication;

  Year19CoreElective() {
    challenge = Year19Challenge();
    subCondition.add(challenge);
    creativity = Year19Creativity();
    subCondition.add(creativity);
    fusion = Year19Fusion();
    subCondition.add(fusion);
    trust = Year19Trust();
    subCondition.add(trust);
    communication = Year19Communication();
    subCondition.add(communication);
  }

  @override
  void analysisUpdate() {
    int internshipCount = 0;
    for(DetailCondition condition in subCondition) {
      condition.analysisUpdate();
      if(condition.isSatisfied) {
        internshipCount++;
      }
    }

    satisfied = internshipCount;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
