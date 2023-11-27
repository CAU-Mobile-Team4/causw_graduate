import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/GraduateAnalysis.dart';
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
        ChangeNotifierProvider(create: (context) => userData.additionalCondition),
        ChangeNotifierProvider(create: (context) => GraduateAnalysis()),
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
      body: GraduateListTest(),
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

class GraduateListTest extends StatelessWidget {
  const GraduateListTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final graduateAnalysis = Provider.of<GraduateAnalysis>(context);

    Widget _buildTextBasedOnType(DetailCondition condition) {
      switch (condition.type) {
        case 1:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(condition.conditionName),
              Text('${condition.satisfied}/${condition.require}')
            ],
          );
        case 2:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${condition.conditionName} (아래 ${condition.subCondition.length}개 중 ${condition.require}개 이상 만족)'),
              Text('${condition.satisfied}/${condition.require}')
            ],
          );
        case 3:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('-> ${condition.conditionName}'),
              Text('${condition.satisfied}/${condition.require}')
            ],
          );
        default:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(condition.conditionName),
              Text('${condition.satisfied}/${condition.require}')
            ],
          );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('${graduateAnalysis.satisfiedConditionCount}', style: TextStyle(fontSize: 20)),
          Expanded(
            child: ListView.builder(
              itemCount: graduateAnalysis.satisfiedCondition.length,
              itemBuilder: (context, index) {
                DetailCondition condition = graduateAnalysis.satisfiedCondition[index];
                return ListTile(
                  title: _buildTextBasedOnType(condition)
                );
              },
            ),
          ),
          Text('${graduateAnalysis.requiredConditionCount}', style: TextStyle(fontSize: 20)),
          Expanded(
            child: ListView.builder(
              itemCount: graduateAnalysis.requiredCondition.length,
              itemBuilder: (context, index) {
                DetailCondition condition = graduateAnalysis.requiredCondition[index];
                return ListTile(
                  title: _buildTextBasedOnType(condition)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
