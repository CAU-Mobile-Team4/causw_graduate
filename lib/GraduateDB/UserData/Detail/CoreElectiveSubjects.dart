import 'dart:convert';
import 'dart:io';
import 'package:causw_graduate/GraduateDB/UserData/Detail/UserDataDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreElectiveSubjects implements UserDataDetail {
  List<Map<String, dynamic>> list = [];

  CoreElectiveSubjects();

  @override
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? coreElectiveSubjectsString = prefs.getString('coreElectiveSubjects');
    coreElectiveSubjectsString ??= await File('assets/database/coreElectiveSubjects.json').readAsString();

    list = List<Map<String, dynamic>>.from(jsonDecode(coreElectiveSubjectsString));
  }

  @override
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String coreElectiveSubjectsString = jsonEncode(list);
    await prefs.setString('coreElectiveSubjects', coreElectiveSubjectsString);
  }
}
