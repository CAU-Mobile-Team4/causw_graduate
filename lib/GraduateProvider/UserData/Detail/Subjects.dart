import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class Subjects extends UserDataDetail {
  @override
  final String key = 'subjects';

  late List<Map<String, dynamic>> _major;
  late List<Map<String, dynamic>> _bsm;
  late List<Map<String, dynamic>> _specializedElective;
  late Map<String, dynamic> _coreElective;

  List<Map<String, dynamic>> get major => _major;
  List<Map<String, dynamic>> get bsm => _bsm;
  List<Map<String, dynamic>> get specializedElective => _specializedElective;
  Map<String, dynamic> get coreElective => _coreElective;

  void updateSubject(String subjectType, int index, String key, [String? value]) {
    if(subjectType == 'major') {
      if(value != null) {
        _major[index][key] = !_major[index][key];
      }
    } else if(subjectType == 'bsm') {
      if(value != null) {
        _bsm[index][key] = !_bsm[index][key];
      }
    } else if(subjectType == 'specializedElective') {
      if(value != null) {
        _specializedElective[index][key] = !_specializedElective[index][key];
      }
    } else if(subjectType == 'coreElective') {
      if(value != null) {
        _coreElective[index][key] = !_coreElective[index][key];
      }
    }
    notifyListeners();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'major': _major,
      'bsm': _bsm,
      'specializedElective': _specializedElective,
      'coreElective': _coreElective
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    _major = (json['major'] as List).cast<Map<String, dynamic>>();
    _bsm = (json['bsm'] as List).cast<Map<String, dynamic>>();
    _specializedElective = (json['specializedElective'] as List).cast<Map<String, dynamic>>();
    _coreElective = json['coreElective'];
  }
}
