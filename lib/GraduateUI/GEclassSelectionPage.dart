import 'package:causw_graduate/GraduateUI/appColor.dart';
import 'package:flutter/material.dart';

class SelectGEclass extends StatefulWidget {
  const SelectGEclass({super.key});

  @override
  State<SelectGEclass> createState() => _SelectGEclassState();
}

class _SelectGEclassState extends State<SelectGEclass> {
  final classes=List.generate(100, (i) => "Class ${i+1}").toList();
  final List<bool> checkedClasses=List.generate(100, (index) => false);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: AppBar(title: Text('GE CLASS',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
          ),
            leading: const BackButton(
              color: AppColor.purple,
            ),
            backgroundColor: AppColor.background,
            bottom: TabBar(tabs: [Tab(child: Text("핵심 교양",style: TextStyle(color: AppColor.main),)),Tab(child: Text("일반 교양",style: TextStyle(color: AppColor.main)))],
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
