import 'package:causw_graduate/GraduateProvider/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateProvider/Requirement/GraduateAnalysis.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/GraduateUI/EachGraduateQualificationInfo.dart';
import 'package:causw_graduate/GraduateUI/GraduateInformationPage.dart';
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8,
      child: CustomPaint(
        painter: CircularGraphPainter(radius: 30),
      ),
    );
  }
}

class CircularGraphPainter extends CustomPainter {
  final double radius; // 반지름을 전달받는 생성자 추가

  CircularGraphPainter({this.radius = 10.0});
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
      pi/2, // 그릴 각도 (반원이므로 pi)
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
  final classes = List.generate(40, (i) => "Class ${i + 1}").toList();
  final List<bool> checkedClasses = List.generate(40, (index) => false);

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
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> EachGraduateQualificationInfo(guideline: condition.guideLine,)
                    ));
                  }, icon: Icon(Icons.question_mark)),
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
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> EachGraduateQualificationInfo(guideline: condition.guideLine)
                    ));
                  },
                      icon: Icon(Icons.question_mark)),
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
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> EachGraduateQualificationInfo(guideline: condition.guideLine)
                    ));
                  }, icon: Icon(Icons.question_mark)),
                  Text('${condition.satisfied}/${condition.require}'),
                ],
              )
            ],
          );
      }
    }

    List<String> selectedClasses = [];
    for (int i = 0; i < classes.length; i++) {
      if (checkedClasses[i]) {
        selectedClasses.add(classes[i]);
      }
    }

    List<String> selectedClasses2 = [];
    for (int i = 0; i < classes.length; i++) {
      if (!checkedClasses[i]) {
        selectedClasses2.add(classes[i]);
      }
    }

    int checkedCount = checkedClasses.where((element) => element).length;
    int unCheckedCount = checkedClasses.where((element) => !element).length;

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
              Navigator.pop(context, MaterialPageRoute(builder:
              (context)=> InformationEntryPage()
          )
          );
        }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add,color: AppColor.purple,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          },
          tooltip: "강의 추가",
        ),
          IconButton(
              icon: const Icon(
                Icons.question_mark,
                color: AppColor.purple,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GraduateInformation()));
              },
              tooltip: "졸업 요건"),
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
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
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
                              "학점 그래프",
                              style: TextStyle(fontSize: 15),
                            )), //학점 그래프와 학점은 그냥 출력만 해둔거 나중에 데이터 들어오면 기능 구현될거
                        Container(
                            decoration: const BoxDecoration(),
                            child: const HalfCircularGraph()),
                      ])),
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                              width: 150,
                              height: 70,
                              decoration: const BoxDecoration(),
                              alignment: Alignment.center,
                              child: const Text(
                                "학점",
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 20,
                              child: const Text("70/140",
                                  style: TextStyle(fontSize: 20)))
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
                              child: const Text("해결 졸업요건",
                                  style: TextStyle(fontSize: 20))),
                          Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 20,
                              child: Text("$checkedCount/40",
                                  style: const TextStyle(fontSize: 20)))
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
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
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
                        child: const Text("미해결 졸업요건",
                            style: TextStyle(fontSize: 20))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        child: Text("$unCheckedCount 개",
                            style: const TextStyle(fontSize: 20))),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const StartPage()));
      },child:Icon(Icons.home_filled,)),
    );
  }
}
