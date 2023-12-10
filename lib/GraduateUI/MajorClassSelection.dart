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
      length: 2,
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
              Tab(child: Text("전공 기초", style: TextStyle(color: AppColor.main)))
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
              itemCount: subjects.basicMajor.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                    title: Text('${subjects.basicMajor[index]['name']}',
                        style: TextStyle(
                            color: AppColor.main, fontWeight: FontWeight.bold)),
                    value: subjects.basicMajor[index]['isSatisfied'],
                    onChanged: (value) {
                      setState(() {
                        subjects.updateSubject(
                            'basicMajor', index, 'isSatisfied');
                      });
                    });
              },
            ),
          )),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartPage()));
            },
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Icon(
              Icons.home_filled,
            )),
      ),
    );
  }
}
