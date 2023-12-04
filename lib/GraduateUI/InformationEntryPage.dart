import 'package:causw_graduate/GraduateProvider/UserData/Detail/StudentInfo.dart';
import 'package:causw_graduate/GraduateUI/GraduateQualification.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/startPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationEntryPage extends StatefulWidget {
  const InformationEntryPage({super.key});

  @override
  State<InformationEntryPage> createState() => _InformationEntryPageState();
}

class _InformationEntryPageState extends State<InformationEntryPage> {

  Widget build(BuildContext context) {
    final studentInfo = Provider.of<StudentInfo>(context);

    return Scaffold(
      backgroundColor: AppColor.background,
      //backgroundColor: Colors.#B0B2D9,
      body: Center(
        child: Column(
          children: [Container(
            height: 170,
          ),
            Container(
              alignment: Alignment.topLeft,
                child: Text("  ENTER\n  YOUR\n  INFORMATION",style: TextStyle(fontSize: 40,color: AppColor.main,fontWeight: FontWeight.bold),)
            ),
            Container(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                    child: Center(child: const Text("Entry Year",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: DropdownButton(
                      value: studentInfo.admissionYear,
                      items: studentInfo.admissionYearList
                          .map(
                              (admissionYear)=>DropdownMenuItem(
                              value: admissionYear,
                              child: Text("$admissionYear",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))).toList(),
                      onChanged: (value){
                        studentInfo.admissionYear = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                    child: Center(
                        child: const Text("STATUS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                    )
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: DropdownButton(
                      value: studentInfo.majorStatus,
                      items: studentInfo.majorStatusList
                          .map(
                              (major)=>DropdownMenuItem(
                              value: major,
                              child: Text(major,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))).toList(),
                      onChanged: (value){
                        studentInfo.majorStatus = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 16,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColor.main)),
                child: Text('ENTER',style: TextStyle(fontSize: 25,color: AppColor.background,fontWeight: FontWeight.bold),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> GraduateQualification()
                  )
                  );
                }),
          ],
        ),
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
