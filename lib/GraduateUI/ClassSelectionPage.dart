import 'package:causw_graduate/GraduateUI/BSMclassSelection.dart';
import 'package:causw_graduate/GraduateUI/GEclassSelectionPage.dart';
import 'package:causw_graduate/GraduateUI/GraduateQualification.dart';
import 'package:causw_graduate/GraduateUI/GraduationETCPage.dart';
import 'package:causw_graduate/GraduateUI/MajorClassSelection.dart';
import 'package:causw_graduate/AppColor.dart';
import 'package:flutter/material.dart';

import '../startPage.dart';

class ClassSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar:
      AppBar(title: Text("SELECT CLASS",style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),backgroundColor: AppColor.background,

        leading: IconButton(onPressed: (){
          Navigator.pop(context, MaterialPageRoute(builder:
              (context)=> GraduateQualification()
          )
          );
        }, icon: Icon(Icons.arrow_back,color: AppColor.purple,)),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [SizedBox(
                      height: 200,width: 400,
                      child: Card(
                        shape: ContinuousRectangleBorder(
                          borderRadius:
                            BorderRadius.circular(16.0),
                            side: BorderSide(width: 1.0,color: AppColor.background)

                        ),
                        elevation: 40.0,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)
                              ),
                              child: Container(
                                height: 90,
                                alignment: Alignment.center,
                                color: AppColor.background,
                                child: Text(
                                  "MAJOR",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColor.main),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            Container(
                              height: 90,
                              alignment: Alignment.center,
                              child: FloatingActionButton(
                                backgroundColor: AppColor.background,
                                  child: Icon(Icons.add,size: 50,color: AppColor.main,),
                                  onPressed:(){
                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context)=> MajorClass()
                                    )
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ]
                  ),
                ),
                Center(
                  child: Stack(
                      children: [SizedBox(
                        height: 200,width: 400,
                        child: Card(
                          shape: ContinuousRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(16.0),
                              side: BorderSide(width: 1.0,color: AppColor.background)

                          ),
                          elevation: 40.0,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)
                                ),
                                child: Container(
                                  height: 90,
                                  alignment: Alignment.center,
                                  color: AppColor.background,
                                  child: Text(
                                    "BSM",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColor.main),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 90,
                                alignment: Alignment.center,
                                child: FloatingActionButton(
                                    backgroundColor: AppColor.background,
                                    child: Icon(Icons.add,size: 50,color: AppColor.main,),
                                    onPressed:(){
                                      Navigator.push(context, MaterialPageRoute(builder:
                                          (context)=> BSMclassSelection()
                                      )
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ]
                  ),
                ),
                Center(
                  child: Stack(
                      children: [SizedBox(
                        height: 200,width: 400,
                        child: Card(
                          shape: ContinuousRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(16.0),
                              side: BorderSide(width: 1.0,color: AppColor.background)

                          ),
                          elevation: 40.0,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)
                                ),
                                child: Container(
                                  height: 90,
                                  alignment: Alignment.center,
                                  color: AppColor.background,
                                  child: Text(
                                    "GE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColor.main),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 90,
                                alignment: Alignment.center,
                                child: FloatingActionButton(
                                    backgroundColor: AppColor.background,
                                    child: Icon(Icons.add,size: 50,color: AppColor.main,),
                                    onPressed:(){
                                      Navigator.push(context, MaterialPageRoute(builder:
                                          (context)=> SelectGEclass()
                                      )
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ]
                  ),
                ),
                Center(
                  child: Stack(
                      children: [SizedBox(
                        height: 200,width: 400,
                        child: Card(
                          shape: ContinuousRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(16.0),
                            side: BorderSide(width: 1.0,color: AppColor.background),

                          ),
                          elevation: 40.0,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                ),
                                child: Container(
                                  height: 90,
                                  alignment: Alignment.center,
                                  color: AppColor.background,
                                  child: Text(
                                    "ETC",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColor.main),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 90,
                                alignment: Alignment.center,
                                child: FloatingActionButton(
                                    backgroundColor: AppColor.background,
                                    child: Icon(Icons.add,size: 50,color: AppColor.main,),
                                    onPressed:(){
                                      Navigator.push(context, MaterialPageRoute(builder:
                                          (context)=> GraduateEtc()
                                      )
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const StartPage()));
      },child:Icon(Icons.home_filled,)),
    );
  }
}

