import 'package:causw_graduate/GraduateDB/Requirement/Detail/TotalCredit/TotalCredit.dart';
import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';

class Year19TotalCredit extends TotalCredit {
  @override
  int require = 140;
  @override
  int satisfied = 0;

  @override
  void analysisGraduate() {
    UserData userData = UserData();
    int credits = 0;
    for(Map<String, dynamic> map in userData.majorSubjects.list) {
      if(map.containsKey('credit') && map['credit'] is num) {
        credits += map['credit'] as int;
      }
    }
    for(Map<String, dynamic> map in userData.bsmSubjects.list) {
      if(map.containsKey('credit') && map['credit'] is num) {
        credits += map['credit'] as int;
      }
    }
    for(Map<String, dynamic> map in userData.specializedElectiveSubjects.list) {
      if(map.containsKey('credit') && map['credit'] is num) {
        credits += map['credit'] as int;
      }
    }
    for(Map<String, dynamic> map in userData.coreElectiveSubjects.list) {
      if(map.containsKey('credit') && map['credit'] is num) {
        credits += map['credit'] as int;
      }
    }
  }
}
