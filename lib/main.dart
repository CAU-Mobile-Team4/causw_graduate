import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/calendar/calendar.dart';
import 'package:causw_graduate/calendar/schedule_list_provider.dart';
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
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: const TabBarView(
              children: [
                Calendar(),
                Calendar(),
              ],
            ),
            extendBodyBehindAppBar: true, // add this line

            bottomNavigationBar: Container(
              color: AppColor.background, //색상
              child: Container(
                height: 70,
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: const TabBar(
                  //tab 하단 indicator size -> .label = label의 길이
                  //tab 하단 indicator size -> .tab = tab의 길이
                  indicatorSize: TabBarIndicatorSize.label,
                  //tab 하단 indicator color
                  indicatorColor: AppColor.main,
                  //tab 하단 indicator weight
                  indicatorWeight: 2,
                  //label color
                  labelColor: AppColor.main,
                  //unselected label color
                  unselectedLabelColor: Colors.black38,
                  labelStyle: TextStyle(
                    fontSize: 13,
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.checklist_outlined,
                      ),
                      text: 'Graduation Check List',
                    ),
                    Tab(
                      icon: Icon(Icons.calendar_month_outlined),
                      text: 'Calendar',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
