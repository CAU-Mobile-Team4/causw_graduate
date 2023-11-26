import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Internship/UndergraduateResearchAssistant/UndergraduateResearchAssistant.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19UndergraduateResearchAssistant extends UndergraduateResearchAssistant {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    if (userData.additionalCondition.internship['undergraduateResearchAssistant'] == true) {
      satisfied = 1;
    } else {
      satisfied = 0;
    }

    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
