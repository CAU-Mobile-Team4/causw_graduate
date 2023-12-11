import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/FieldTraning/Year19FieldTraining.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/IndustrialInternship/Year19IndustrialInternship.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/Internship.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/StartUp/Year19StartUp.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/UndergraduateResearchAssistant/Year19UndergraduateResearchAssistant.dart';

class Year19Internship extends Internship {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  late DetailCondition industrialInternship;
  late DetailCondition fieldTraining;
  late DetailCondition startUp;
  late DetailCondition undergraduateResearchAssistant;

  Year19Internship() {
    industrialInternship = Year19IndustrialInternship();
    subCondition.add(industrialInternship);
    fieldTraining = Year19FieldTraining();
    subCondition.add(fieldTraining);
    startUp = Year19StartUp();
    subCondition.add(startUp);
    undergraduateResearchAssistant = Year19UndergraduateResearchAssistant();
    subCondition.add(undergraduateResearchAssistant);
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
