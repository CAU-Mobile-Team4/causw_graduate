import 'package:causw_graduate/GraduateQualification.dart';
import 'package:flutter/material.dart';

class InformationEntryPage extends StatefulWidget {
  const InformationEntryPage({super.key});

  @override
  State<InformationEntryPage> createState() => _InformationEntryPageState();
}

class _InformationEntryPageState extends State<InformationEntryPage> {
  final _classOfYearList=[18,19,20];
  final _majorList=["주전공","복수전공","융합전공",];
  var _major="주전공";
  var _classOfYear=19;
  @override
  void initState() {
    super.initState();
    setState(() {
      _classOfYear = _classOfYearList[0];
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.#B0B2D9,
      appBar: AppBar(title: Text('Information Entry'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 4,
                    child: Center(child: const Text("학번",style: TextStyle(fontSize: 25),))
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: DropdownButton(
                      value: _classOfYear,
                      items: _classOfYearList
                          .map(
                              (year)=>DropdownMenuItem(
                              value: year,
                              child: Text("$year",style: TextStyle(fontSize: 25),))).toList(),
                      onChanged: (value){
                        setState(() {
                          _classOfYear=value!;
                        });
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
                        child: const Text("전공종류",style: TextStyle(fontSize: 25),)
                    )
                ),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: DropdownButton(
                      value: _major,
                      items: _majorList
                          .map(
                              (major)=>DropdownMenuItem(
                              value: major,
                              child: Text(major,style: TextStyle(fontSize: 25),))).toList(),
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
            Container(
              height: 16,
            ),
            ElevatedButton(
                child: Text('확인',style: TextStyle(fontSize: 25),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> GraduateQualification()
                  )
                  );
                }),
          ],
        ),
      ),
    );
  }
}


