import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final subjects = Provider.of<Subjects>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: AppBar(title: Text('GE CLASS',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),
          ),
            leading: IconButton(onPressed: (){
              Navigator.pop(context, MaterialPageRoute(builder:
                  (context)=> ClassSelection()
              )
              );
            }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
            centerTitle: true,
            automaticallyImplyLeading: false,

            backgroundColor: AppColor.background,
            bottom: TabBar(tabs: [Tab(child: Text("핵심 교양",style: TextStyle(color: AppColor.main),)),Tab(child: Text("전문 교양",style: TextStyle(color: AppColor.main)))],
            ),
          ),
          body: TabBarView(children: [Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('도전'),IconButton(onPressed:(){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('핵심-도전',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        content: Container(
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: (subjects.coreElective['challenge'] as List).length,
                            itemBuilder: (context,index){
                              return CheckboxListTile(
                                  title: Text('${subjects.coreElective['challenge'][index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                                  value: subjects.coreElective['challenge'][index]['isSatisfied'],
                                  onChanged: (value){
                                    subjects.updateSubject('coreElective', index, 'isSatisfied');
                                  }
                              );
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }, icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('창의'),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('핵심-창의',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['creativity'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['creativity'][index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['creativity'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied');
                                    }
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('융합'),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('핵심-융합',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['convergence'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['convergence'][index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['convergence'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied');
                                    }
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('신뢰'),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('핵심-신뢰',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['trust'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['trust'][index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['trust'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied');
                                    }
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('소통'),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('핵심-소통',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['communication'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['communication'][index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['communication'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied');
                                    }
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ],
            ),
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
