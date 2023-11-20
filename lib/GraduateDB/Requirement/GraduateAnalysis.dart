import 'package:causw_graduate/GraduateDB/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateDB/Requirement/Year/Year19GraduationReq.dart';
import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';

import 'Year/GraduationReq.dart';

class GraduateAnalysis {
  late GraduationReq graduationReq;
  List<DetailCondition> list = [];

  GraduateAnalysis();

  List<DetailCondition> getGraduationAnalysis() {
    UserData userData = UserData();

    if (userData.studentInfo.majorStatus == '주전공') {
      if (userData.studentInfo.admissionYear == 19) {
        graduationReq = Year19GraduationReq();
      }
    } else if (userData.studentInfo.majorStatus == '부전공') {

    } else if (userData.studentInfo.majorStatus == '복수전공') {

    } else {

    }
    graduationReq = Year19GraduationReq();

    return list;
  }
}
