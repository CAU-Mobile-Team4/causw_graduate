import 'package:causw_graduate/GraduateProvider/UserData/UserDataDetail.dart';

class AdditionalCondition extends UserDataDetail {
  @override
  final String key = 'additional';

  late Map<String, dynamic> _counseling;
  late Map<String, dynamic> _thesis;
  late Map<String, dynamic> _hanja;
  late Map<String, dynamic> _internship;

  Map<String, dynamic> get counseling => _counseling;
  Map<String, dynamic> get thesis => _thesis;
  Map<String, dynamic> get hanja => _hanja;
  Map<String, dynamic> get internship => _internship;

  @override
  Map<String, dynamic> toJson() {
    return {
      'counseling': _counseling,
      'thesis': _thesis,
      'hanja': _hanja,
      'internship': _internship
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    _counseling = json['counseling'];
    _thesis = json['thesis'];
    _hanja = json['hanja'];
    _internship = json['internship'];
  }
}
