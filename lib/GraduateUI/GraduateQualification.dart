import 'package:causw_graduate/GraduateDB/Requirement/Detail/DetailCondition.dart';
import 'package:causw_graduate/GraduateDB/Requirement/GraduateAnalysis.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/GraduateUI/GraduateInformationPage.dart';
import 'package:causw_graduate/GraduateUI/InformationEntryPage.dart';

import 'package:causw_graduate/GraduateUI/appColor.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HalfCircularGraph extends StatefulWidget {
  const HalfCircularGraph({super.key});

  @override
  State<HalfCircularGraph> createState() => _HalfCircularGraphState();
}

class _HalfCircularGraphState extends State<HalfCircularGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      pi, // 그릴 각도 (반원이므로 pi)
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius+16),
      -pi, // 시작 각도
      pi, // 그릴 각도 (반원이므로 pi)
      false,
      borderPaint2,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius-16),
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
  final classes=List.generate(40, (i) => "Class ${i+1}").toList();
  final List<bool> checkedClasses=List.generate(40, (index) => false);
  List<DetailCondition> list = GraduateAnalysis().getGraduationAnalysis();

  @override
  Widget build(BuildContext context) {

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
      appBar: AppBar(title: Text('QUALIFICATION',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColor.background,
        leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
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
          icon: Icon(Icons.question_mark,color: AppColor.purple,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> GraduateInformation()
            )
            );
            },
            tooltip: "졸업 요건"
        ),
      ],
      ),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: AppColor.purple,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.main.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                      ),
                  ],
                  border: Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1))),
              height: 100,
              child:Row(
                children: [
                  Flexible(
                    flex:1,
                      child: Stack(
                        children:[
                          Container(
                            height: 50,
                              alignment: Alignment.center,
                              child: Text("학점 그래프",style: TextStyle(fontSize: 15),)),//학점 그래프와 학점은 그냥 출력만 해둔거 나중에 데이터 들어오면 기능 구현될거
                          Container(
                            decoration: BoxDecoration(
                            ),child: HalfCircularGraph()),
                        ]
                      )
                  ),
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                              width: 150,
                              height: 70,
                              decoration: BoxDecoration(
                              ),
                              alignment: Alignment.center,
                              child: Text("학점",style: TextStyle(fontSize: 20),)
                          ),
                          Container(
                            alignment: Alignment.center,
                              width: 150,
                              height: 20,
                              child: Text("70/140",style: TextStyle(fontSize: 20))
                          )
                        ],
                      )),
                  Flexible(
                      flex:1,
                      child: Column(
                        children: [
                          Container(
                              width: 150,
                              height: 70,
                              decoration: BoxDecoration(
                          ),
                              alignment: Alignment.center,
                              child: Text("해결 졸업요건",style: TextStyle(fontSize: 20))
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 20,
                              child: Text("$checkedCount/40",style: TextStyle(fontSize: 20))
                          )
                        ],
                      )),
                ],
              )
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                padding: EdgeInsets.all(8.0),
              itemCount: selectedClasses.length,
              itemBuilder: (context,index){
                return CheckboxListTile(
                    title: Text(selectedClasses[index],style: TextStyle(fontWeight: FontWeight.bold),),
                    value: checkedClasses[classes.indexOf(selectedClasses[index])],
                    onChanged: (value){
                      setState(() {
                        checkedClasses[classes.indexOf(selectedClasses[index])] = value!;
                      });
                    }
                );
              },
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: AppColor.background,
                  border: Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1)),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.main.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
              alignment: Alignment.center,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex:1,
                    child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                        ),
                        alignment: Alignment.center,
                        child: Text(
                            "미해결 졸업요건",
                            style: TextStyle(fontSize: 20)
                        )
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        child: Text("$unCheckedCount 개",style: TextStyle(fontSize: 20))
                    ),
                  )
                ],
              )
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemCount: selectedClasses2.length,
              itemBuilder: (context,index){
                return CheckboxListTile(
                    title: Text(selectedClasses2[index],style: TextStyle(fontWeight: FontWeight.bold),),
                    value: checkedClasses[classes.indexOf(selectedClasses2[index])],
                    onChanged: (value){
                      setState(() {
                        checkedClasses[classes.indexOf(selectedClasses2[index])] = value!;
                      });
                    }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



