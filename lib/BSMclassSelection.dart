import 'package:flutter/material.dart';

class BSMclassSelection extends StatefulWidget {
  const BSMclassSelection({super.key});

  @override
  State<BSMclassSelection> createState() => _BSMclassSelectionState();
}

class _BSMclassSelectionState extends State<BSMclassSelection> {

  final classes=List.generate(100, (i) => "Class ${i+1}").toList();
  final List<bool> checkedClasses=List.generate(100, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select BSM Class'),),
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
