import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../startPage.dart';

class MajorClass extends StatefulWidget {
  const MajorClass({super.key});

  @override
  State<MajorClass> createState() => _MajorClassState();
}

class _MajorClassState extends State<MajorClass> {
  final classes = List.generate(100, (i) => "Class ${i + 1}").toList();
  final List<bool> checkedClasses = List.generate(100, (index) => false);

  @override
  Widget build(BuildContext context) {
    final subjects = Provider.of<Subjects>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: Text(
            'MAJOR CLASS',
            style: TextStyle(color: AppColor.main, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClassSelection()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.main,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home_filled,color: AppColor.main,),
              onPressed: () {
                Navigator.popUntil(
                    context,
                        (route) => route.isFirst);
              },
              tooltip: "홈",
            ),
          ],
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.background,
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text(
                "전공",
                style: TextStyle(color: AppColor.main),
              )),
              Tab(
                  child: Text(
                    "설계전공",
                    style: TextStyle(color: AppColor.main),
                  )),
              Tab(
                  child: Text(
                    "비전공자용 전공",
                    style: TextStyle(color: AppColor.main),
                  )),
            ],
          ),
        ),
        body: TabBarView(children: [
          Expanded(
            child: Container(
                child: ListView.builder(
              itemCount: subjects.major.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${subjects.major[index]['name']}',
                    style: TextStyle(
                        color: AppColor.main, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButton(
                        value: subjects.major[index]['english'],
                        items: (subjects.option['english'] as List)
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )))
                            .toList(),
                        onChanged: (value) {
                          subjects.updateSubject(
                              'major', index, 'english', value as String?);
                        },
                      ),
                      Checkbox(
                          value: subjects.major[index]['isSatisfied'],
                          onChanged: (value) {
                            subjects.updateSubject(
                                'major', index, 'isSatisfied');
                          }),
                    ],
                  ),
                );
              },
            )),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              itemCount: subjects.designMajor.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${subjects.designMajor[index]['name']}',
                    style: TextStyle(
                        color: AppColor.main, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButton(
                        value: subjects.designMajor[index]['english'],
                        items: (subjects.option['english'] as List)
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )))
                            .toList(),
                        onChanged: (value) {
                          subjects.updateSubject(
                              'designMajor', index, 'english', value as String?);
                        },
                      ),
                      Checkbox(
                          value: subjects.designMajor[index]['isSatisfied'],
                          onChanged: (value) {
                            subjects.updateSubject(
                                'designMajor', index, 'isSatisfied');
                          }),
                    ],
                  ),
                );
              },
            ),
          )),
          Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: subjects.nonSWStudentMajor.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${subjects.nonSWStudentMajor[index]['name']}',
                        style: TextStyle(
                            color: AppColor.main, fontWeight: FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButton(
                            value: subjects.nonSWStudentMajor[index]['english'],
                            items: (subjects.option['english'] as List)
                                .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )))
                                .toList(),
                            onChanged: (value) {
                              subjects.updateSubject(
                                  'nonSWStudentMajor', index, 'english', value as String?);
                            },
                          ),
                          Checkbox(
                              value: subjects.nonSWStudentMajor[index]['isSatisfied'],
                              onChanged: (value) {
                                subjects.updateSubject(
                                    'nonSWStudentMajor', index, 'isSatisfied');
                              }),
                        ],
                      ),
                    );
                  },
                ),
              )),
        ]),
      ),
    );
  }
}
