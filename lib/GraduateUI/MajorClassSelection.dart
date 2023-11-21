import 'package:causw_graduate/GraduateUI/appColor.dart';
import 'package:flutter/material.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(title: Text('MAJOR CLASS',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
        ),
          leading: const BackButton(
            color: AppColor.purple,
          ),
          backgroundColor: AppColor.background,
          bottom: TabBar(tabs: [Tab(child: Text("전공",style: TextStyle(color: AppColor.main),)),Tab(child: Text("전공 기초",style: TextStyle(color: AppColor.main)))],
        ),
        ),
        body: TabBarView(children: [Expanded(
          child: Container(
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context,index){
                  return CheckboxListTile(
                      title: Text(classes[index],style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                      value: checkedClasses[index],
                      onChanged: (value){
                        setState(() {
                      checkedClasses[index]=value!;
                    });
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
          )),
        )],)
      ),
    );
  }
}
