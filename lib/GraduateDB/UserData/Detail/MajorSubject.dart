import 'dart:convert';
import 'package:causw_graduate/GraduateDB/UserData/UserDataDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MajorSubject implements UserDataDetail {
  late Map<String, dynamic> majorSubjects;

  MajorSubject() {
    loadData();
  }

  @override
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonSubjects = prefs.getString('subjects');
    majorSubjects = jsonDecode(jsonSubjects!);
  }

  @override
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonMajorSubjects = jsonEncode(majorSubjects);
    await prefs.setString('subjects', jsonMajorSubjects);
  }
}
