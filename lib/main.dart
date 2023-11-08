import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.indigo,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  TabController? _tabController;
  bool checked1 = false;
  bool checked2 = false;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabIndex);
    _tabController?.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
    FocusScope.of(context).unfocus();
  }

  List<String> messages = [];

  TextEditingController messageController = TextEditingController();

  void sendDate(DateTime date) async {

    var response = await http.post(
      Uri.parse('url/dates'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'date': date.toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      print('Date sent successfully');
    } else {
      print('Failed to send date');
    }
  }

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {

      // var response = await http.post(
      //   Uri.parse('url/messages'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      //   body: jsonEncode(<String, String>{
      //     'message': messageController.text,
      //   }),
      // );

      setState(() {
        messages.add(messageController.text);
      });

      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: DefaultTabController(
          length:3,
          child:Scaffold(


            body : TabBarView (
              children:[
                Column(
                  children:[
                    SizedBox(height: 10,),

                    Stack(
                      children: [
                        TableCalendar (
                          firstDay : DateTime.utc(2020,3,6),
                          lastDay : DateTime.utc(2030,3,6),
                          focusedDay:focusedDay,
                          selectedDayPredicate:(day){
                            return isSameDay(selectedDay, day);
                          },
                          onFormatChanged:(format){
                            if(selectedDay != null){
                              setState((){});
                            }
                          },
                          availableCalendarFormats: const{
                            CalendarFormat.month: 'Today',
                            CalendarFormat.twoWeeks: 'Today',
                            CalendarFormat.week:'Today',
                          },
                          headerStyle: HeaderStyle(
                            formatButtonVisible: true,
                          ),
                          onPageChanged:(pageDate){
                            setState((){focusedDay = pageDate;});
                          },
                          onDaySelected:(selectedDays,_){
                            setState((){selectedDay = selectedDays;focusedDay = selectedDays;});
                            sendDate(selectedDays);
                            print('User selected day ${selectedDays}');
                          },
                        ),
                        Positioned(
                            top: 9,
                            right: 62,
                            child: TextButton(
                              onPressed: (){
                                setState(() {
                                  focusedDay = DateTime.now();
                                  selectedDay = DateTime.now();
                                });
                              },
                              child: Text('  '),)
                        )
                      ],
                    ),


                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('\t\t🗓️\t\tOctober 20\n\n\t\t19:00 Mid-term Exam'),
                    )
                  ],
                ),

                Column(children:[
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) => MessageBubble(message: messages[index]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children:<Widget>[
                      Expanded(child:
                      Container(
                        width: 300.0,
                        height: 45.0,
                        child: TextField(
                          controller:messageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your Schedule',
                          ),

                        ),
                      )
                      ),
                      IconButton(onPressed:
                      sendMessage, icon:
                      Icon(Icons.schedule_send),
                      )
                    ]),
                  )
                ]),

                Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Subject 1'),
                      value: checked2,
                      onChanged: (value) {
                        setState(() {
                          checked2 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 2'),
                      value: checked1,
                      onChanged: (value) {
                        setState(() {
                          checked1 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 3'),
                      value: checked2,
                      onChanged: (value) {
                        setState(() {
                          checked2 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 4'),
                      value: checked1,
                      onChanged: (value) {
                        setState(() {
                          checked1 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 5'),
                      value: checked1,
                      onChanged: (value) {
                        setState(() {
                          checked1 = value!;
                        });
                      },
                    ),CheckboxListTile(
                      title: const Text('Subject 6'),
                      value: checked2,
                      onChanged: (value) {
                        setState(() {
                          checked2 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 7'),
                      value: checked1,
                      onChanged: (value) {
                        setState(() {
                          checked1 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 8'),
                      value: checked2,
                      onChanged: (value) {
                        setState(() {
                          checked2 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Subject 9'),
                      value: checked2,
                      onChanged: (value) {
                        setState(() {
                          checked2 = value!;
                        });
                      },
                    ),


                  ],
                )
              ],
            ),

            drawer : const Drawer(),
          ),
        ));
  }
}

class MessageBubble extends StatelessWidget {
  final String message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child:
          Text(message, style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
