import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class Subjects extends UserDataDetail {
  @override
  final String key = 'subjects';

  late List<Map<String, dynamic>> _major;
  late List<Map<String, dynamic>> _bsm;
  late List<Map<String, dynamic>> _specializedElective;
  late List<Map<String, dynamic>> _coreElective;

  List<Map<String, dynamic>> get major => _major;
  List<Map<String, dynamic>> get bsm => _bsm;
  List<Map<String, dynamic>> get specializedElective => _specializedElective;
  List<Map<String, dynamic>> get coreElective => _coreElective;

  set major(List<Map<String, dynamic>> value) {
    _major = value;
    notifyListeners();
  }

  set bsm(List<Map<String, dynamic>> value) {
    _bsm = value;
    notifyListeners();
  }

  set specializedElective(List<Map<String, dynamic>> value) {
    _specializedElective = value;
    notifyListeners();
  }

  set coreElective(List<Map<String, dynamic>> value) {
    _coreElective = value;
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
    _coreElective = (json['coreElective'] as List).cast<Map<String, dynamic>>();
  }
}
