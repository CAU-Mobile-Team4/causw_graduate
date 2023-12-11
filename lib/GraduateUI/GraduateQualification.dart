

import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';

import 'package:causw_graduate/GraduateProvider/Requirement/GraduateAnalysis.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/GraduateUI/InformationEntryPage.dart';


import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/startPage.dart';


import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class HalfCircularGraph extends StatefulWidget {
  const HalfCircularGraph({super.key});

  @override
  State<HalfCircularGraph> createState() => _HalfCircularGraphState();
}

class _HalfCircularGraphState extends State<HalfCircularGraph> {
  @override
  Widget build(BuildContext context) {
    final graduateAnalysis2 = Provider.of<GraduateAnalysis>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8,
      child: CustomPaint(
        painter: CircularGraphPainter(graduateAnalysis: graduateAnalysis2, radius: 30),
      ),
    );
  }
}

class CircularGraphPainter extends CustomPainter {
  final double radius; // 반지름을 전달받는 생성자 추가
  final graduateAnalysis;
  CircularGraphPainter({required this.graduateAnalysis, this.radius = 10.0});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    Paint borderPaint2 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Paint borderPaint = Paint()
      ..color = Colors.black // 테두리 색상 설정
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Offset center = Offset(size.width / 2, size.height);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi, // 시작 각도
      pi*((graduateAnalysis.requiredCondition[0].satisfied)/(graduateAnalysis.requiredCondition[0].require)), // 그릴 각도 (반원이므로 pi)
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius + 16),
      -pi, // 시작 각도
      pi, // 그릴 각도 (반원이므로 pi)
      false,
      borderPaint2,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 16),
      -pi, // 시작 각도
      pi, // 그릴 각도 (반원이므로 pi)
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class GraduateQualification extends StatefulWidget {
  const GraduateQualification({super.key});

  @override
  State<GraduateQualification> createState() => _GraduateQualificationState();
}

class _GraduateQualificationState extends State<GraduateQualification> {

  @override
  Widget build(BuildContext context) {
    final graduateAnalysis = Provider.of<GraduateAnalysis>(context);
    Widget _buildTextBasedOnType(DetailCondition condition) {
      switch (condition.type) {
        case 2:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${condition.conditionName} (아래 ${condition.subCondition.length}개 중 ${condition.require}개 이상 만족)'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('${condition.conditionName}',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: SizedBox(
                              width: double.maxFinite,
                              child: Text('${condition.guideLine}')
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  }, icon: Icon(Icons.question_mark,color: AppColor.main,)),
                  Text('${condition.satisfied}/${condition.require}'),
                ],
              )
            ],
          );
        case 3:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('-> ${condition.conditionName}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('${condition.conditionName}',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: SizedBox(
                              width: double.maxFinite,
                              child: Text('${condition.guideLine}')
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                      icon: Icon(Icons.question_mark,color: AppColor.main)),
                  Text('${condition.satisfied}/${condition.require}'),
                ],
              )
            ],
          );
        default:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(condition.conditionName),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('${condition.conditionName}',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: Text('${condition.guideLine}')
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  }, icon: Icon(Icons.question_mark,color: AppColor.main)),
                  Text('${condition.satisfied}/${condition.require}'),
                ],
              )
            ],
          );
      }
    }


    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const Text('QUALIFICATION',
            style:
                TextStyle(color: AppColor.main, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColor.background,
        leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
              (context)=> InformationEntryPage()
          )
          );
        }, icon: Icon(Icons.arrow_back,color: AppColor.main,)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add,color: AppColor.main,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          },
          tooltip: "강의 추가",
        ),
        ],
      ),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(

                color: AppColor.background,


                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 10), // changes position of shadow
                    ),
                  ],
                  border: const Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1))),
              height: 100,
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Stack(children: [
                        Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              "Credit Graph",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            )), //학점 그래프와 학점은 그냥 출력만 해둔거 나중에 데이터 들어오면 기능 구현될거
                        Container(
                            decoration: const BoxDecoration(),
                            child: const HalfCircularGraph()),
                      ])),
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 150,
                              height: 70,
                              decoration: const BoxDecoration(),
                              alignment: Alignment.center,
                              child: const Text(
                                "CREDIT",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              )),
                          Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 20,
                              child: graduateAnalysis.requiredCondition[0].satisfied < 140 ? Text("${graduateAnalysis.requiredCondition[0].satisfied}/${graduateAnalysis.requiredCondition[0].require}",
                                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) :  Text('Satisfied',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange)),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                              width: 150,
                              height: 70,
                              decoration: const BoxDecoration(),
                              alignment: Alignment.center,
                              child: const Text("RESOLVED",
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                          Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 20,
                              child: Text("${graduateAnalysis.satisfiedConditionCount}/${graduateAnalysis.requiredConditionCount+graduateAnalysis.satisfiedConditionCount}",
                                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))
                        ],
                      )),
                ],
              )),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: graduateAnalysis.satisfiedCondition.length,
              itemBuilder: (context, index) {
                DetailCondition condition =
                    graduateAnalysis.satisfiedCondition[index];
                return ListTile(title: _buildTextBasedOnType(condition));
              },
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: AppColor.background,
                border: const Border(
                    top: BorderSide(color: Colors.grey, width: 1),
                    bottom: BorderSide(color: Colors.grey, width: 1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: const Offset(0, 10), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.center,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                        width: 150,
                        height: 60,
                        decoration: const BoxDecoration(),
                        alignment: Alignment.center,
                        child: const Text("UNRESOLVED",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        child: Text("${graduateAnalysis.requiredConditionCount}/${graduateAnalysis.requiredConditionCount+graduateAnalysis.satisfiedConditionCount}",
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  )
                ],
              )),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: graduateAnalysis.requiredCondition.length,
              itemBuilder: (context, index) {
                DetailCondition condition =
                    graduateAnalysis.requiredCondition[index];
                return ListTile(title: _buildTextBasedOnType(condition));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.popUntil(
            context,
            (route) => route.isFirst);
      },backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),child:Icon(Icons.home_filled,)),
    );
  }
}
