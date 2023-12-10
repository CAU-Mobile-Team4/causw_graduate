import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class AdditionalCondition extends UserDataDetail {
  @override
  final String key = 'additional';

  late Map<String, dynamic> _additionalCredit;
  late Map<String, dynamic> _counseling;
  late Map<String, dynamic> _thesis;
  late Map<String, dynamic> _hanja;
  late Map<String, dynamic> _internship;
  late Map<String, dynamic> _openSource;
  late Map<String, dynamic> _english;

  Map<String, dynamic> get additionalCredit => _additionalCredit;
  Map<String, dynamic> get counseling => _counseling;
  Map<String, dynamic> get thesis => _thesis;
  Map<String, dynamic> get hanja => _hanja;
  Map<String, dynamic> get internship => _internship;
  Map<String, dynamic> get openSource => _openSource;
  Map<String, dynamic> get english => _english;

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

  void updateOpenSource(String key) {
    _openSource[key] = !_openSource[key];
    notifyListeners();
  }

  void updateEnglish(String key) {
    _english[key] = !_english[key];
    notifyListeners();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'additionalCredit': _additionalCredit,
      'counseling': _counseling,
      'thesis': _thesis,
      'hanja': _hanja,
      'internship': _internship,
      'openSource': _openSource,
      'english': _english
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    _additionalCredit = json['additionalCredit'];
    _counseling = json['counseling'];
    _thesis = json['thesis'];
    _hanja = json['hanja'];
    _internship = json['internship'];
    _openSource = json['openSource'];
    _english = json['english'];
  }
}
