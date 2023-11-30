import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
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
      backgroundColor: AppColor.background,
        appBar: AppBar(title: Text('BSM CLASS',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
        ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
          backgroundColor: AppColor.background,
          automaticallyImplyLeading: false,
         ),
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
