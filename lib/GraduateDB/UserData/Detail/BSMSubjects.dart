import 'dart:convert';
import 'dart:io';
import 'package:causw_graduate/GraduateDB/UserData/Detail/UserDataDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BSMSubjects implements UserDataDetail {
  List<Map<String, dynamic>> list = [];

  BSMSubjects();

  @override
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? bsmSubjectsString = prefs.getString('bsmSubjects');
    bsmSubjectsString ??= await File('assets/database/bsmSubjects.json').readAsString();

    list = List<Map<String, dynamic>>.from(jsonDecode(bsmSubjectsString));
  }

  @override
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String majorSubjectsString = jsonEncode(list);
    await prefs.setString('bsmSubjects', majorSubjectsString);
  }
}
