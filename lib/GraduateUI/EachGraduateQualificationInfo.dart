import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/GraduateUI/GraduateQualification.dart';
import 'package:flutter/material.dart';

class EachGraduateQualificationInfo extends StatelessWidget {
  final String? guideline;
  const EachGraduateQualificationInfo({Key? key, this.guideline}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(title: Text("HELP INFO",style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
          backgroundColor: AppColor.background,
          centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> GraduateQualification()
              )
              );
            }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
      ),
      body: Text('$guideline'),
    );
  }
}
