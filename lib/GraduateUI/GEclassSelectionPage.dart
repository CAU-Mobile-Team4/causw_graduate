import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/startPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectGEclass extends StatefulWidget {
  const SelectGEclass({super.key});

  @override
  State<SelectGEclass> createState() => _SelectGEclassState();
}

class _SelectGEclassState extends State<SelectGEclass> {
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
            'GE CLASS',
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
                "핵심교양",
                style: TextStyle(color: AppColor.main),
              )),
              Tab(
                  child: Text(
                    "전문교양",
                    style: TextStyle(color: AppColor.main),
                  )),
              Tab(
                  child: Text(
                    "공통교양+기타",
                    style: TextStyle(color: AppColor.main),
                  ))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '   핵심-도전',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColor.main),
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final subjects = Provider.of<Subjects>(context);

                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    '핵심-도전',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.main),
                                  ),
                                  content: Container(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount:
                                          (subjects.coreElective['challenge']
                                                  as List)
                                              .length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                            title: Text(
                                              '${subjects.coreElective['challenge'][index]['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: subjects
                                                    .coreElective['challenge']
                                                [index]['isSatisfied'],
                                            onChanged: (value) {
                                              subjects.updateSubject(
                                                  'coreElective',
                                                  index,
                                                  'isSatisfied',
                                                  'challenge');
                                            });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("확인"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('   핵심-창조',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColor.main)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final subjects = Provider.of<Subjects>(context);
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    '핵심-창의',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.main),
                                  ),
                                  content: Container(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount:
                                          (subjects.coreElective['creativity']
                                                  as List)
                                              .length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                            title: Text(
                                              '${subjects.coreElective['creativity'][index]['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: subjects
                                                    .coreElective['creativity']
                                                [index]['isSatisfied'],
                                            onChanged: (value) {
                                              subjects.updateSubject(
                                                  'coreElective',
                                                  index,
                                                  'isSatisfied',
                                                  'creativity');
                                            });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("확인"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('   핵심-융합',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColor.main)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final subjects = Provider.of<Subjects>(context);
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    '핵심-융합',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.main),
                                  ),
                                  content: Container(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount: (subjects
                                              .coreElective['fusion'] as List)
                                          .length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                            title: Text(
                                              '${subjects.coreElective['fusion'][index]['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value:
                                                subjects.coreElective['fusion']
                                                    [index]['isSatisfied'],
                                            onChanged: (value) {
                                              subjects.updateSubject(
                                                  'coreElective',
                                                  index,
                                                  'isSatisfied',
                                                  'fusion');
                                            });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("확인"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('   핵심-신뢰',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColor.main)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final subjects = Provider.of<Subjects>(context);
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    '핵심-신뢰',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.main),
                                  ),
                                  content: Container(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount: (subjects.coreElective['trust']
                                              as List)
                                          .length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                            title: Text(
                                              '${subjects.coreElective['trust'][index]['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value:
                                                subjects.coreElective['trust']
                                                    [index]['isSatisfied'],
                                            onChanged: (value) {
                                              subjects.updateSubject(
                                                  'coreElective',
                                                  index,
                                                  'isSatisfied',
                                                  'trust');
                                            });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("확인"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('   핵심-소통',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColor.main)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final subjects = Provider.of<Subjects>(context);
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Text(
                                    '핵심-소통',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.main),
                                  ),
                                  content: SizedBox(
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount: (subjects
                                                  .coreElective['communication']
                                              as List)
                                          .length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                            title: Text(
                                              '${subjects.coreElective['communication'][index]['name']}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: subjects.coreElective[
                                                    'communication'][index]
                                                ['isSatisfied'],
                                            onChanged: (value) {
                                              subjects.updateSubject(
                                                  'coreElective',
                                                  index,
                                                  'isSatisfied',
                                                  'communication');
                                            });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("확인"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                itemCount: subjects.specializedElective.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      title: Text(
                        '${subjects.specializedElective[index]['name']}',
                        style: TextStyle(
                            color: AppColor.main, fontWeight: FontWeight.bold),
                      ),
                      value: subjects.specializedElective[index]['isSatisfied'],
                      onChanged: (value) {
                        subjects.updateSubject(
                            'specializedElective', index, 'isSatisfied');
                      });
                },
              )),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                itemCount: subjects.generalElective.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      title: Text(
                        '${subjects.generalElective[index]['name']}',
                        style: TextStyle(
                            color: AppColor.main, fontWeight: FontWeight.bold),
                      ),
                      value: subjects.generalElective[index]['isSatisfied'],
                      onChanged: (value) {
                        subjects.updateSubject(
                            'generalElective', index, 'isSatisfied');
                      });
                },
              )),
            )
          ],
        ),

      ),
    );
  }
}
