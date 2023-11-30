import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class AdditionalCondition extends UserDataDetail {
  @override
  final String key = 'additional';

  late Map<String, dynamic> _additionalCredit;
  late Map<String, dynamic> _counseling;
  late Map<String, dynamic> _thesis;
  late Map<String, dynamic> _hanja;
  late Map<String, dynamic> _internship;

  Map<String, dynamic> get additionalCredit => _additionalCredit;
  Map<String, dynamic> get counseling => _counseling;
  Map<String, dynamic> get thesis => _thesis;
  Map<String, dynamic> get hanja => _hanja;
  Map<String, dynamic> get internship => _internship;

  void updateAdditionalCredit(String key, int value) {
    _additionalCredit[key] = value;
    notifyListeners();
  }

  void updateCounseling(String key, int value) {
    if (key == 'advisorCount' || key == 'otherCount') {
      _counseling[key] = value;
      notifyListeners();
    }
  }

  void updateThesis(String key) {
    _thesis[key] = !_thesis[key];
    notifyListeners();
  }

  void updateHanja(String key) {
    _hanja[key] = !_hanja[key];
    notifyListeners();
  }

  void updateInternship(String key) {
    _internship[key] = !_internship[key];
    notifyListeners();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'additionalCredit': _additionalCredit,
      'counseling': _counseling,
      'thesis': _thesis,
      'hanja': _hanja,
      'internship': _internship
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    _additionalCredit = json['additionalCredit'];
    _counseling = json['counseling'];
    _thesis = json['thesis'];
    _hanja = json['hanja'];
    _internship = json['internship'];
  }
}
