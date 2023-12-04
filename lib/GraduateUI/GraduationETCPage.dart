import 'package:causw_graduate/GraduateProvider/UserData/Detail/AdditionalCondition.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../startPage.dart';

class GraduateEtc extends StatefulWidget {
  const GraduateEtc({super.key});

  @override
  State<GraduateEtc> createState() => _GraduateEtcState();
}

class _GraduateEtcState extends State<GraduateEtc> {
  @override
  Widget build(BuildContext context) {
    final additional = Provider.of<AdditionalCondition>(context);
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(title: Text('ETC',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
    ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
    backgroundColor: AppColor.background,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
              title: Text('Undergraduate Research Assignment',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.internship['undergraduateResearchAssistant'],
              onChanged: (value){
                additional.updateInternship('undergraduateResearchAssistant');
              }
          )
          ,
          CheckboxListTile(
              title: Text('Start Up',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.internship['startUp'],
              onChanged: (value){
                additional.updateInternship('startUp');
              }
          )
          ,

          CheckboxListTile(
              title: Text('Industrial Internship',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.internship['industrialInternship'],
              onChanged: (value){
                additional.updateInternship('industrialInternship');
              }
          )
          ,
          CheckboxListTile(
              title: Text('Field Training',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.internship['fieldTraining'],
              onChanged: (value){
                additional.updateInternship('fieldTraining');
              }
          )
          ,

          CheckboxListTile(
              title: Text('Hanja Class',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.hanja['class'],
              onChanged: (value){
                additional.updateHanja('class');
              }
          )
          ,
          CheckboxListTile(
              title: Text('Hanja Test',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.hanja['test'],
              onChanged: (value){
                additional.updateHanja('test');
              }
          )
          ,
          CheckboxListTile(
            title: Text('Topcit',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
              value: additional.thesis['topcit'],
              onChanged: (value){
                additional.updateThesis('topcit');
              }
          )
          ,CheckboxListTile(
            title: Text('Thesis',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main)),
            value: additional.thesis['standard'],
            onChanged: (value){
              additional.updateThesis('standard');
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                  child: const Text("Counseling",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),)
              ),
              Center(
                child: DropdownButton(
                  value: additional.counseling['advisorCount'],
                  items: (additional.counseling['advisorList'] as List)
                      .map(
                          (advisorCount)=>DropdownMenuItem(
                          value: advisorCount,
                          child: Text('$advisorCount',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.text),))).toList(),
                  onChanged: (value){
                    setState(() {
                      additional.counseling['advisorCount']=value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const StartPage()));
      },backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),child:Icon(Icons.home_filled,)),
    );
  }
}
