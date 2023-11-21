import 'package:causw_graduate/GraduateUI/MajorClassSelection.dart';
import 'package:causw_graduate/GraduateUI/appColor.dart';
import 'package:flutter/material.dart';

class ClassSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(title: Text("SELECT CLASS",style: TextStyle(color: AppColor.main,fontWeight: FontWeight.bold),),backgroundColor: AppColor.background,),
      body: Center(
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
                      side: BorderSide(width: 1.0),

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
                            color: Color(0xFFB0B2D9),
                            child: Text(
                              "전공",style: TextStyle(fontSize: 30),
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
                            backgroundColor: Color(0xFFB0B2D9),
                              child: Icon(Icons.add,size: 50,),
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
                        side: BorderSide(width: 1.0),

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
                              color: Color(0xFFB0B2D9),
                              child: Text(
                                "BSM",style: TextStyle(fontSize: 30),
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
                                backgroundColor: Color(0xFFB0B2D9),
                                child: Icon(Icons.add,size: 50,),
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
                        side: BorderSide(width: 1.0),

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
                              color: Color(0xFFB0B2D9),
                              child: Text(
                                "교양",style: TextStyle(fontSize: 30),
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
                                backgroundColor: Color(0xFFB0B2D9),
                                child: Icon(Icons.add,size: 50,),
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
          ],
        ),
      )
    );
  }
}

