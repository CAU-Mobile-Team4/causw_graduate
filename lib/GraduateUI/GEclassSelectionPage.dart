import 'package:causw_graduate/GraduateProvider/UserData/Detail/Subjects.dart';
import 'package:causw_graduate/GraduateUI/ClassSelectionPage.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/startPage.dart';
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
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> ClassSelection()
              )
              );
            }, icon: Icon(Icons.arrow_back,color: AppColor.main,)),
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
                  Text('CHALLENGE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColor.main),),IconButton(onPressed:(){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final subjects = Provider.of<Subjects>(context);

                        return AlertDialog(
                        title: Text('핵심-도전',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.main),),
                        content: Container(
                          width: double.maxFinite,
                          child: ListView.builder(
                            itemCount: (subjects.coreElective['challenge'] as List).length,
                            itemBuilder: (context,index){
                              return CheckboxListTile(
                                  title: Text('${subjects.coreElective['challenge'][index]['name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                  value: subjects.coreElective['challenge'][index]['isSatisfied'],
                                  onChanged: (value){
                                    subjects.updateSubject('coreElective', index, 'isSatisfied', 'challenge');
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
                      );
                      },
                    );
                  }, icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CREATIVITY',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColor.main)),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          final subjects = Provider.of<Subjects>(context);
                          return AlertDialog(
                          title: Text('핵심-창의',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['creativity'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['creativity'][index]['name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['creativity'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied', 'creativity');
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
                        );
                        },
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('FUSION',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColor.main)),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          final subjects = Provider.of<Subjects>(context);
                          return AlertDialog(
                          title: Text('핵심-융합',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['fusion'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['fusion'][index]['name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['fusion'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied', 'fusion');
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
                        );
                        },
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TRUST',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColor.main)),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          final subjects = Provider.of<Subjects>(context);
                          return AlertDialog(
                          title: Text('핵심-신뢰',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: Container(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['trust'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['trust'][index]['name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['trust'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied', 'trust');
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
                        );
                        },
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('COMMUNICATION',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColor.main)),IconButton(onPressed:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          final subjects = Provider.of<Subjects>(context);
                          return AlertDialog(
                          title: Text('핵심-소통',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.main),),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: (subjects.coreElective['communication'] as List).length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title: Text('${subjects.coreElective['communication'][index]['name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                                    value: subjects.coreElective['communication'][index]['isSatisfied'],
                                    onChanged: (value){
                                      subjects.updateSubject('coreElective', index, 'isSatisfied', 'communication');
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
                        );
                        },
                      );
                    }, icon: Icon(Icons.arrow_forward_ios_rounded,))
                  ],
                ),
              ],
            ),
          ),Expanded(
            child: Container(
                child: ListView.builder(
                  itemCount: subjects.specializedElective.length,
                  itemBuilder: (context,index){
                    return CheckboxListTile(
                        title: Text('${subjects.specializedElective[index]['name']}',style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),
                        value: subjects.specializedElective[index]['isSatisfied'],
                        onChanged: (value){
                          subjects.updateSubject('specializedElective', index, 'isSatisfied');
                        }
                    );
                  },
                )),
          )],),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const StartPage()));
        },backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),child:Icon(Icons.home_filled,)),
      ),
    );
  }
}
