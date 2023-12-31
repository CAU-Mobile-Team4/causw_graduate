import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class Subjects extends UserDataDetail {
  @override
  final String key = 'subjects';

  late List<Map<String, dynamic>> _major;
  late List<Map<String, dynamic>> _designMajor;
  late List<Map<String, dynamic>> _nonSWStudentMajor;
  late List<Map<String, dynamic>> _bsm;
  late List<Map<String, dynamic>> _specializedElective;
  late Map<String, dynamic> _coreElective;
  late List<Map<String, dynamic>> _generalElective;
  late Map<String, dynamic> _option;

  List<Map<String, dynamic>> get major => _major;
  List<Map<String, dynamic>> get designMajor => _designMajor;
  List<Map<String, dynamic>> get nonSWStudentMajor => _nonSWStudentMajor;
  List<Map<String, dynamic>> get bsm => _bsm;
  List<Map<String, dynamic>> get specializedElective => _specializedElective;
  Map<String, dynamic> get coreElective => _coreElective;
  List<Map<String, dynamic>> get generalElective => _generalElective;
  Map<String, dynamic> get option => _option;

  void updateSubject(String subjectType, int index, String key, [String? value]) {
    if(subjectType == 'major') {
      if(value == null) {
        _major[index][key] = !_major[index][key];
      } else {
        _major[index][key] = value;
      }
    } else if(subjectType == 'designMajor') {
      if(value == null) {
        _designMajor[index][key] = !_designMajor[index][key];
      } else {
        _designMajor[index][key] = value;
      }
    } else if(subjectType == 'nonSWStudentMajor') {
      if(value == null) {
        _nonSWStudentMajor[index][key] = !_nonSWStudentMajor[index][key];
      } else {
        _nonSWStudentMajor[index][key] = value;
      }
    } else if(subjectType == 'bsm') {
      if(value == null) {
        _bsm[index][key] = !_bsm[index][key];
      } else {
        _bsm[index][key] = value;
      }
    } else if(subjectType == 'specializedElective') {
      if(value == null) {
        _specializedElective[index][key] = !_specializedElective[index][key];
      }
    } else if(subjectType == 'coreElective') {
      if(value != null) {
        _coreElective[value][index][key] = !_coreElective[value][index][key];
      }
    } else if(subjectType == 'generalElective') {
      if(value == null) {
        _generalElective[index][key] = !_generalElective[index][key];
      }
    }
    notifyListeners();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'major': _major,
      'designMajor': _designMajor,
      'nonSWStudentMajor': _nonSWStudentMajor,
      'bsm': _bsm,
      'specializedElective': _specializedElective,
      'coreElective': _coreElective,
      'generalElective': _generalElective,
      'option': _option
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    _major = (json['major'] as List).cast<Map<String, dynamic>>();
    _designMajor = (json['designMajor'] as List).cast<Map<String, dynamic>>();
    _nonSWStudentMajor = (json['nonSWStudentMajor'] as List).cast<Map<String, dynamic>>();
    _bsm = (json['bsm'] as List).cast<Map<String, dynamic>>();
    _specializedElective = (json['specializedElective'] as List).cast<Map<String, dynamic>>();
    _coreElective = json['coreElective'];
    _generalElective = (json['generalElective'] as List).cast<Map<String, dynamic>>();
    _option = json['option'];
  }
}
