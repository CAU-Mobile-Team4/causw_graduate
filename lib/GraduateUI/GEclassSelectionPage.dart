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
    return Scaffold(
        appBar: AppBar(title: Text('Select GE Class',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),backgroundColor: AppColor.background,
        leading: const BackButton(
          color: AppColor.purple,
        )),
        body: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context,index){
            return CheckboxListTile(
                title: Text(classes[index]),
                value: checkedClasses[index],
                onChanged: (value){
                  setState(() {
                    checkedClasses[index]=value!;
                  });
                }
            );
          },
        )
    );
  }
}
