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
  TextEditingController _creditController = TextEditingController();
  TextEditingController _averageCreditController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final additional = Provider.of<AdditionalCondition>(context);
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(title: Text('ETC',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
    ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          }, icon: Icon(Icons.arrow_back,color: AppColor.main,)),
    backgroundColor: AppColor.background,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Padding(
            padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,10.0),
            child: TextField(
              controller: _creditController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '수강한 일반교양의 총 학점을 입력해주세요'
              ),
              onSubmitted: (String value) {
                // 입력된 숫자를 가져와서 변수에 저장
               additional.additionalCredit['normalElective'] = int.tryParse(value) ?? 0;
                 },
            ),
          ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,10.0),
              child: TextField(
                controller: _averageCreditController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: '당신의 평균 학점을 입력해주세요'
                ),
                onSubmitted: (String value) {
                  // 입력된 숫자를 가져와서 변수에 저장
                  additional.grade['score'] = double.tryParse(value) ?? 0;
                },
              ),
            ),
            CheckboxListTile(
                title: Text('학부연구생',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.internship['undergraduateResearchAssistant'],
                onChanged: (value){
                  additional.updateInternship('undergraduateResearchAssistant');
                }
            )
            ,
            CheckboxListTile(
                title: Text('창업',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.internship['startUp'],
                onChanged: (value){
                  additional.updateInternship('startUp');
                }
            )
            ,

            CheckboxListTile(
                title: Text('학기인턴',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.internship['industrialInternship'],
                onChanged: (value){
                  additional.updateInternship('industrialInternship');
                }
            )
            ,
            CheckboxListTile(
                title: Text('현장실습',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.internship['fieldTraining'],
                onChanged: (value){
                  additional.updateInternship('fieldTraining');
                }
            )
            ,

            CheckboxListTile(
                title: Text('한자 강의 1회이상 수강',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.hanja['class'],
                onChanged: (value){
                  additional.updateHanja('class');
                }
            )
            ,
            CheckboxListTile(
                title: Text('한자 4급',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
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
              title: Text('논문',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main)),
              value: additional.thesis['standard'],
              onChanged: (value){
                additional.updateThesis('standard');
              }
            ),
            CheckboxListTile(
                title: Text('ACT수강',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.act['isSatisfied'],
                onChanged: (value){
                  additional.updateAct('isSatisfied');
                }
            )
            ,
            CheckboxListTile(
                title: Text('오픈소스 개발자 커뮤니티에 1건이상 개방',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.openSource['isSatisfied'],
                onChanged: (value){
                  additional.updateOpenSource('isSatisfied');
                }
            )
            ,
            CheckboxListTile(
                title: Text('토익 750이상 or 토익 스피킹 5급이상',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),),
                value: additional.english['test'],
                onChanged: (value){
                  additional.updateEnglish('test');
                }
            )
            ,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: const Text("    상담",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.main),)
                ),
                Center(
                  child: DropdownButton(
                    value: additional.counseling['advisorCount'],
                    items: (additional.counseling['advisorList'] as List)
                        .map(
                            (advisorCount)=>DropdownMenuItem(
                            value: advisorCount,
                            child: Text('$advisorCount',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))).toList(),
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
