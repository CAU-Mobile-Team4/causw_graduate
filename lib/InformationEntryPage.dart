import 'package:causw_graduate/GraduateQualification.dart';
import 'package:flutter/material.dart';

class InformationEntryPage extends StatefulWidget {
  const InformationEntryPage({super.key});

  @override
  State<InformationEntryPage> createState() => _InformationEntryPageState();
}

class _InformationEntryPageState extends State<InformationEntryPage> {
  final _classOfYearList=[2018,2019,2020];
  final _majorList=["주전공","복수전공","융합전공",];
  var _major="주전공";
  var _classOfYear=2019;
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
                const Text("학번"),
                DropdownButton(
                  value: _classOfYear,
                  items: _classOfYearList
                      .map(
                          (point)=>DropdownMenuItem(
                          value: point,
                          child: Text("$point"))).toList(),
                  onChanged: (value){
                    setState(() {
                      _classOfYear=value!;
                    });
                  },
                ),
              ],
            ),
            Container(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("전공종류"),
                DropdownButton(
                  value: _major,
                  items: _majorList
                      .map(
                          (major)=>DropdownMenuItem(
                          value: major,
                          child: Text(major))).toList(),
                  onChanged: (value){
                    setState(() {
                      _major=value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(child: Text('확인'),onPressed: (){
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


