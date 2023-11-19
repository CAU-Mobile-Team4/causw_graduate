import 'package:causw_graduate/BSMclassSelection.dart';
import 'package:causw_graduate/GEclassSelectionPage.dart';
import 'package:causw_graduate/MajorClassSelection.dart';
import 'package:flutter/material.dart';

class ClassSelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Class"),),
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
                        Container(
                          height: 90,
                          alignment: Alignment.center,
                          child: Text(
                            "전공",style: TextStyle(fontSize: 30),
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
                              child: Text('+',style: TextStyle(fontSize: 50),),
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
                          Container(
                            height: 90,
                            alignment: Alignment.center,
                            child: Text(
                              "BSM",style: TextStyle(fontSize: 30),
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
                                child: Text('+',style: TextStyle(fontSize: 50),),
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
                          Container(
                            height: 90,
                            alignment: Alignment.center,
                            child: Text(
                              "교양",style: TextStyle(fontSize: 30),
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
                                child: Text('+',style: TextStyle(fontSize: 50),),
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

