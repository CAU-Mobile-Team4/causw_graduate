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
      body: ElevatedButton(child: Text('강의 추가'),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:
            (context)=> ClassSelection()
        )
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:
          (context)=> GraduateInformation()
        )
        );
      },
      child: const Icon(Icons.quiz),),

    );
  }
}
