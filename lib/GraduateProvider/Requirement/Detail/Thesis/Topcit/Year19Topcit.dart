import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Thesis/Topcit/Topcit.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Topcit extends Topcit {
  @override
  final int require = 1;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    if (userData.additionalCondition.thesis['topcit'] == true) {
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
