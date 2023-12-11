import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/GraduateReq.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/Year19GraduateReq.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/Year20GraduateReq.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/Year/YearTestGraduateReq.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';
import 'package:flutter/material.dart';

class GraduateAnalysis with ChangeNotifier {
  final List<DetailCondition> _satisfiedCondition = [];
  final List<DetailCondition> _requiredCondition = [];

  /// List index 수가 아닌 졸업요건 갯수
  /// or 조건으로 대표 조건 1개에 서브 조건 여러개일시 count는 1만 증가
  int _satisfiedConditionCount = 0;
  int _requiredConditionCount = 0;

  int _satisfiedCredit = 0;
  int _requiredCredit = 1;

  String _studentInfo = '';

  int get satisfiedConditionCount => _satisfiedConditionCount;
  int get requiredConditionCount => _requiredConditionCount;

  int get satisfiedCredit => _satisfiedCredit;
  int get requiredCredit => _requiredCredit;

  String get studentInfo => _studentInfo;

  List<DetailCondition> get satisfiedCondition => _satisfiedCondition;
  List<DetailCondition> get requiredCondition => _requiredCondition;

  GraduateAnalysis() {
    update();
  }

  void update() {
    UserData userData = UserData();
    GraduateReq graduateReq;

    _satisfiedCondition.clear();
    _satisfiedConditionCount = 0;
    _requiredCondition.clear();
    _requiredConditionCount = 0;

    graduateReq = YearTestGraduateReq();
    if(userData.studentInfo.majorStatus == '주전공') {
      if(userData.studentInfo.admissionYear == 19) {
        graduateReq = Year19GraduateReq();
      } else if(userData.studentInfo.admissionYear == 20) {
        graduateReq = Year20GraduateReq();
      }
    } else if (userData.studentInfo.majorStatus == '부전공') {
      graduateReq = YearTestGraduateReq();
    } else if (userData.studentInfo.majorStatus == '복수전공') {
      graduateReq = YearTestGraduateReq();
    }

    _studentInfo = graduateReq.studentInfo;

    for(DetailCondition condition in graduateReq.condition) {
      condition.analysisUpdate();
      if(condition.type == 1) {
        if(condition.conditionName == '총 학점') {
          if(condition.satisfied < condition.require) {
            _satisfiedCredit = condition.satisfied;
          } else {
            _satisfiedCredit = condition.require;
          }
          _requiredCredit = condition.require;
        }
        if(condition.isSatisfied) {
          _satisfiedCondition.add(condition);
          _satisfiedConditionCount++;
        } else {
          _requiredCondition.add(condition);
          _requiredConditionCount++;
        }
      } else if(condition.type == 2) {
        if(condition.isSatisfied) {
          _satisfiedCondition.add(condition);
          _satisfiedConditionCount++;
          for(DetailCondition subCondition in condition.subCondition) {
            _satisfiedCondition.add(subCondition);
          }
        } else {
          _requiredCondition.add(condition);
          _requiredConditionCount++;
          for(DetailCondition subCondition in condition.subCondition) {
            _requiredCondition.add(subCondition);
          }
        }
      }
    }
    notifyListeners();
  }
}
