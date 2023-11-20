import 'dart:convert';
import 'dart:io';
import 'package:causw_graduate/GraduateDB/UserData/UserDataDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecializedElectiveSubjects implements UserDataDetail {
  List<Map<String, dynamic>> list = [];

  SpecializedElectiveSubjects();

  @override
  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? specializedElectiveSubjectsString = prefs.getString('specializedElectiveSubjects');
    specializedElectiveSubjectsString ??= await File('assets/database/specializedElectiveSubjects.json').readAsString();

    list = List<Map<String, dynamic>>.from(jsonDecode(specializedElectiveSubjectsString));
  }

  @override
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String specializedElectiveSubjectsString = jsonEncode(list);
    await prefs.setString('specializedElectiveSubjects', specializedElectiveSubjectsString);
  }
}
