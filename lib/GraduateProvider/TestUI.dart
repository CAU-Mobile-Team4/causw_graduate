import 'package:causw_graduate/GraduateProvider/UserData/Detail/StudentInfo.dart';
import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
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
      ],
      child: TestUI(),
    ),
  );
}

class TestUI extends StatelessWidget {
  const TestUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: SubjectsTest(),
    );
  }
}

class StudentInfoTest extends StatelessWidget {
  const StudentInfoTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentInfo = Provider.of<StudentInfo>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('${studentInfo.admissionYear}', style: TextStyle(fontSize: 20)),
          Expanded(
            child: ListView.builder(
              itemCount: studentInfo.admissionYearList.length,
              itemBuilder: (context, index) {
                int admissionYear = studentInfo.admissionYearList[index];
                return ListTile(
                  title: Text('$admissionYear'),
                  onTap: () {
                    studentInfo.admissionYear = admissionYear;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectsTest extends StatelessWidget {
  const SubjectsTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subjects = Provider.of<Subjects>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: subjects.major.length,
              itemBuilder: (context, index) {
                String name = subjects.major[index]['name'];
                return ListTile(
                  title: Text(name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}