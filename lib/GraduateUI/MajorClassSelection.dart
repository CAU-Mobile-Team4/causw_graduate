import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MajorClass extends StatefulWidget {
  const MajorClass({super.key});

  @override
  State<MajorClass> createState() => _MajorClassState();
}

class _MajorClassState extends State<MajorClass> {
  final classes=List.generate(100, (i) => "Class ${i+1}").toList();
  final List<bool> checkedClasses=List.generate(100, (index) => false);
  @override
  Widget build(BuildContext context) {
    final subjects = Provider.of<Subjects>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(title: Text('MAJOR CLASS',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
        ),
          leading: IconButton(onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.background,
          bottom: TabBar(tabs: [Tab(child: Text("전공",style: TextStyle(color: AppColor.main),)),Tab(child: Text("전공 기초",style: TextStyle(color: AppColor.main)))],
        ),
        ),
        body: TabBarView(children: [
          Expanded(
          child: Container(
              child: ListView.builder(
                itemCount: subjects.major.length,
                itemBuilder: (context,index){
                  return CheckboxListTile(
                      title: Text('${subjects.major[index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                      value: subjects.major[index]['isSatisfied'],
                      onChanged: (value){
                        subjects.updateSubject('major', index, 'isSatisfied');
                      }
              );
            },
          )),
        ),Expanded(
          child: Container(
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context,index){
              return CheckboxListTile(
                  title: Text(classes[index],style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold)),
                  value: checkedClasses[index],
                  onChanged: (value){
                    setState(() {
                      checkedClasses[index]=value!;
                    });
                  }
              );
            },
          ),

        )
      ),
    ])),
    );
  }
}
