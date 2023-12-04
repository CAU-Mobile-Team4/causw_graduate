import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../startPage.dart';

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
    final subjects = Provider.of<Subjects>(context);
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
          itemCount: subjects.bsm.length,
          itemBuilder: (context,index){
            return CheckboxListTile(
                title: Text('${subjects.bsm[index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                value: subjects.bsm[index]['isSatisfied'],
                onChanged: (value){
                  subjects.updateSubject('bsm', index, 'isSatisfied');
                }
            );
          },
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
