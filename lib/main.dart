import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/calendar.dart';
import 'package:causw_graduate/schedule_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScheduleListProvider()),
      ],
      child: MaterialApp(
        title: 'First Flutter App',
        theme: ThemeData(
          primaryColor: AppColor.main,
          primarySwatch: AppColor.createMaterialColor(AppColor.main),
          fontFamily: 'Nunito',
        ),
        home: const Calendar(),
      ),
    );
  }
}
