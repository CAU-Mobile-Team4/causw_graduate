import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';
import 'package:flutter/material.dart';

void main() async {
  UserData userData = UserData();
  await userData.majorSubjects.loadData();

  runApp(const TestData());
}

class TestData extends StatelessWidget {
  const TestData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Test Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserData userData = UserData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userData.majorSubjects.list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(userData.majorSubjects.list[index]['name']),
        );
      },
    );
  }
}