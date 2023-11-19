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
    return Scaffold(
      appBar: AppBar(title: Text('Select Major Class'),),
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
