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
  final classes = List.generate(100, (i) => "Class ${i + 1}").toList();
  final List<bool> checkedClasses = List.generate(100, (index) => false);

  @override
  Widget build(BuildContext context) {
    final subjects = Provider.of<Subjects>(context);
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text(
          'BSM CLASS',
          style: TextStyle(color: AppColor.main, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClassSelection()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.main,
            )),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.home_filled,color: AppColor.main,),
            onPressed: () {
              Navigator.popUntil(
                  context,
                      (route) => route.isFirst);
            },
            tooltip: "홈",
          ),
        ],
        backgroundColor: AppColor.background,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: subjects.bsm.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${subjects.bsm[index]['name']}',
              style:
                  TextStyle(color: AppColor.main, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  value: subjects.bsm[index]['english'],
                  items: (subjects.option['english'] as List)
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )))
                      .toList(),
                  onChanged: (value) {
                    subjects.updateSubject(
                        'bsm', index, 'english', value as String?);
                  },
                ),
                Checkbox(
                    value: subjects.bsm[index]['isSatisfied'],
                    onChanged: (value) {
                      subjects.updateSubject('bsm', index, 'isSatisfied');
                    }),
              ],
            ),
          );
        },
      ),

    );
  }
}
