import 'dart:convert';
import 'dart:io';
import 'package:causw_graduate/GraduateDB/UserData/Detail/UserDataDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MajorSubjects implements UserDataDetail {
  List<Map<String, dynamic>> list = [];

  MajorSubjects();

  @override
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? majorSubjectsString = prefs.getString('majorSubjects');
    majorSubjectsString ??= await File('assets/database/majorSubjects.json').readAsString();

    list = List<Map<String, dynamic>>.from(jsonDecode(majorSubjectsString));
  }

  @override
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String majorSubjectsString = jsonEncode(list);
    await prefs.setString('majorSubjects', majorSubjectsString);
  }
}
