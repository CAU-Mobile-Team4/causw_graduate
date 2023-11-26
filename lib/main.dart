import 'package:causw_graduate/GraduateUI/InformationEntryPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        fontFamily: 'Nunito'
      ),
      home: InformationEntryPage(),
    );
  }
}
