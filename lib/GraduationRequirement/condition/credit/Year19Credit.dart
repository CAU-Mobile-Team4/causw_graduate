import 'package:causw_graduate/GraduationRequirement/condition/credit/Credit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Year19Credit extends Credit {
  @override
  bool isRequire() {
    return true;
  }
  @override
  int requireCredit() {
    return 140;
  }
  @override
  Future<int> getCredit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('credit') ?? -1;
  }
  @override
  Future<void> setCredit(int credit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('credit', credit);
  }
}
