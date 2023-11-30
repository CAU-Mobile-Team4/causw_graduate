import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/GraduateUI/InformationEntryPage.dart';
import 'package:causw_graduate/calendar/calendar.dart';
import 'package:causw_graduate/calendar/schedule_list_provider.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/GraduateAnalysis.dart';
import 'package:causw_graduate/GraduateProvider/UserData/UserData.dart';
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
        ChangeNotifierProvider(create: (context) => ScheduleListProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAU SW Graduate App',
      theme:ThemeData(
        primaryColor: AppColor.main,
        primarySwatch: AppColor.createMaterialColor(AppColor.main),
        fontFamily: 'Nunito'
      ),
      home: const Calendar(),
    );
  }
}
