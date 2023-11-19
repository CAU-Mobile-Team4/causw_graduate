import 'package:causw_graduate/ClassSelectionPage.dart';
import 'package:causw_graduate/GraduateInformationPage.dart';
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
      ..color = Colors.blue
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
      appBar: AppBar(title: Text('Graduate Qualification'),),
      body: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1))),
              height: 100,
              child:Row(
                children: [
                  Flexible(
                    flex:1,
                      child: Container(
                          decoration: BoxDecoration(
                          ),child: HalfCircularGraph())
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
                    title: Text(selectedClasses[index]),
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
              decoration: const BoxDecoration(

                  border: Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1))),
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
                    title: Text(selectedClasses2[index]),
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
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(Alignment.bottomLeft.x+0.2,Alignment.bottomLeft.y),
            child: FloatingActionButton(
              backgroundColor: Color(0xFFB0B2D9),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> GraduateInformation()
              )
              );
              },
              tooltip: "졸업요건 정보",
              child: const Icon(Icons.quiz),),
        ),
          Align(
            alignment: Alignment(Alignment.bottomLeft.x+0.2,Alignment.bottomLeft.y-0.2),
            child: FloatingActionButton(
              backgroundColor: Color(0xFFB0B2D9),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> ClassSelection()
              )
              );
            },
              tooltip: "강의 추가",
              child: const Icon(Icons.add),
            ),
          )
        ]

      ),

    );
  }
}



