import 'package:causw_graduate/GraduateProvider/Requirement/GraduateAnalysis.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';
import 'package:causw_graduate/GraduateUI/InformationEntryPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final UserData userData = UserData();
  await userData.loadDataAll();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userData.studentInfo),
        ChangeNotifierProvider(create: (context) => userData.subjects),
        ChangeNotifierProvider(create: (context) => userData.additionalCondition),
        ChangeNotifierProvider(create: (context) => GraduateAnalysis()),
      ],
      child: MyApp(),
    ),
  );
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
