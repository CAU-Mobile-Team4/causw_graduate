import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/GraduateUI/appColor.dart';
import 'package:flutter/material.dart';

class GraduateEtc extends StatefulWidget {
  const GraduateEtc({super.key});

  @override
  State<GraduateEtc> createState() => _GraduateEtcState();
}

class _GraduateEtcState extends State<GraduateEtc> {
  final _majorList=[1,2,3,4];
  var _major=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(title: Text('GE CLASS',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
    ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> ClassSelection()
            )
            );
          }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
    backgroundColor: AppColor.background,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Row(
            children: [Text('인턴'),
              Checkbox(value: value, onChanged: (value){
                setState(() {

                });
              }),
            ],
          ),
          Row(
            children: [Text('Topcit 270이상', style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.text),),
              Checkbox(value: value, onChanged: (value){
                setState(() {

                });
              }),
            ],
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 4,
                  child: Center(
                      child: const Text("상담 횟수",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  )
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: DropdownButton(
                    value: _major,
                    items: _majorList
                        .map(
                            (_major)=>DropdownMenuItem(
                            value: _major,
                            child: Text('$_major',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))).toList(),
                    onChanged: (value){
                      setState(() {
                        _major=value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}
