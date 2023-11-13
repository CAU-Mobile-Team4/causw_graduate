import 'package:flutter/material.dart';

import 'calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.indigo,
        fontFamily: 'Pretendard',
      ),
      home: Calendar(),
    );
  }
}
