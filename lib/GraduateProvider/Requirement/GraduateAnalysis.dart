import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/Year19GraduateReq.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';
import 'package:flutter/material.dart';

class GraduateAnalysis with ChangeNotifier {
  final List<DetailCondition> _satisfiedCondition = [];
  final List<DetailCondition> _requiredCondition = [];

  List<DetailCondition> get satisfiedCondition => _satisfiedCondition;
  List<DetailCondition> get requiredCondition => _requiredCondition;

  GraduateAnalysis() {
    update();
  }

  void update() {
    UserData userData = UserData();
    GraduateReq graduateReq;

    _satisfiedCondition.clear();
    _requiredCondition.clear();

    if (userData.studentInfo.majorStatus == '주전공') {
      if (userData.studentInfo.admissionYear == 19) {
        graduateReq = Year19GraduateReq();
      }
    } else if (userData.studentInfo.majorStatus == '부전공') {

    } else if (userData.studentInfo.majorStatus == '복수전공') {

    } else {

    }
    graduateReq = Year19GraduateReq();

    for(DetailCondition condition in graduateReq.condition) {
      if (condition.type != 0) {
        if(condition.isSatisfied) {
          _satisfiedCondition.add(condition);
        } else {
          _requiredCondition.add(condition);
        }
      }
    }
    notifyListeners();
  }
}
