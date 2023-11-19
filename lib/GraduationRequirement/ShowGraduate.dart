import 'package:causw_graduate/GraduationRequirement/year/GraduationReq.dart';
import 'package:causw_graduate/GraduationRequirement/year/Year19GraduationReq.dart';

class ShowGraduate {
  late GraduationReq graduationReq;

  ShowGraduate(int year, bool primary) {
    if(primary) {
      if (year == 19) {
        graduationReq = Year19GraduationReq();
      }
    }
  }
}
