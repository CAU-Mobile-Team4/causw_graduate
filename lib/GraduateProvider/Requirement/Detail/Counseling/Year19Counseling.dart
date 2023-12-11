import 'package:causw_graduate/GraduateProvider/Requirement/Detail/Counseling/Counseling.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';

class Year19Counseling extends Counseling {
  @override
  final int require = 4;

  @override
  int satisfied = 0;
  @override
  bool isSatisfied = false;

  @override
  void analysisUpdate() {
    UserData userData = UserData();

    int counselingCount = 0;
    counselingCount += userData.additionalCondition.counseling['advisorCount'] as int;
    counselingCount += userData.additionalCondition.counseling['otherCount'] as int;

    satisfied = counselingCount;
    if (satisfied >= require) {
      isSatisfied = true;
    } else {
      isSatisfied = false;
    }
  }
}
