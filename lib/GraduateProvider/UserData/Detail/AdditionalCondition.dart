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

  set additionalCredit(Map<String, dynamic> value) {
    _additionalCredit = value;
    notifyListeners();
  }

  set counseling(Map<String, dynamic> value) {
    _counseling = value;
    notifyListeners();
  }

  set thesis(Map<String, dynamic> value) {
    _thesis = value;
    notifyListeners();
  }

  set hanja(Map<String, dynamic> value) {
    _hanja = value;
    notifyListeners();
  }

  set internship(Map<String, dynamic> value) {
    _internship = value;
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
