import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserDataDetail with ChangeNotifier {
  abstract final String key;

  Map<String, dynamic> toJson();
  void fromJson(Map<String, dynamic> json);

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? json = prefs.getString(key);
    json ??= await rootBundle.loadString('assets/database/$key.json');

    Map<String, dynamic> jsonData = jsonDecode(json);
    fromJson(jsonData);
    notifyListeners();
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(toJson()));
  }
}
