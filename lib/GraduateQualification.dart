import 'package:causw_graduate/ClassSelectionPage.dart';
import 'package:causw_graduate/GraduateInformationPage.dart';
import 'package:flutter/material.dart';

class GraduateQualification extends StatefulWidget {
  const GraduateQualification({super.key});

  @override
  State<GraduateQualification> createState() => _GraduateQualificationState();
}

class _GraduateQualificationState extends State<GraduateQualification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Graduate Qualification'),),
      body: Container(),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> GraduateInformation()
              )
              );
              },
              tooltip: "졸업요건 정보",
              child: const Icon(Icons.quiz),),
        ),
          Align(
            alignment: Alignment(Alignment.bottomRight.x,Alignment.bottomRight.y-0.2),
            child: FloatingActionButton(onPressed: (){
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
