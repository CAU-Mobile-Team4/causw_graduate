import 'package:causw_graduate/GraduateDB/UserData/UserDataDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentInfo implements UserDataDetail {
  int? admissionYear;
  String? majorStatus;

  StudentInfo() {
    loadData();
  }

  @override
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    admissionYear = prefs.getInt('admissionYear');
    majorStatus = prefs.getString('majorStatus');
  }

  @override
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('admissionYear', admissionYear!);
    await prefs.setString('isMajor', majorStatus!);
  }
}
