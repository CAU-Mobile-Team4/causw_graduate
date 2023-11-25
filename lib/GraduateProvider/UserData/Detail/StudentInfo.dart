import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class StudentInfo extends UserDataDetail {
  @override
  final String key = 'studentInfo';

  late List<int> _admissionYearList;
  late int _admissionYear;
  late List<String> _majorStatusList;
  late String _majorStatus;

  List<int> get admissionYearList => _admissionYearList;
  int get admissionYear => _admissionYear;
  List<String> get majorStatusList => _majorStatusList;
  String get majorStatus => _majorStatus;

  set admissionYear(int value) {
    _admissionYear = value;
    notifyListeners();
  }

  set majorStatus(String value) {
    _majorStatus = value;
    notifyListeners();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'admissionYearList': _admissionYearList,
      'admissionYear': _admissionYear,
      'majorStatusList': _majorStatusList,
      'majorStatus': _majorStatus
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    _admissionYearList = json['admissionYearList'];
    _admissionYear = json['admissionYear'];
    _majorStatusList = json['majorStatusList'];
    _majorStatus = json['majorStatus'];
  }
}
