
import 'package:flutter/cupertino.dart';

class Student with ChangeNotifier {
  int id;
  String name;

  Student(
  {
    required this.id,
    required this.name
  });

  void setInfo(int newID, String newName) {
    id = newID;
    name = newName;
    notifyListeners();
  }

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

}