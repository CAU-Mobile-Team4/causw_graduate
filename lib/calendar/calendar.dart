import 'dart:math';
import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/calendar/api_services.dart';
import 'package:causw_graduate/calendar/schedule.dart';
import 'package:causw_graduate/calendar/schedule_list_provider.dart';
import 'package:causw_graduate/calendar/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

Color getRandomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    Student student = context.read<Student>();
    context.read<ScheduleListProvider>().updateScheduleList(student.id);
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var student = Provider.of<Student>(context);
    DateTime selectedDayWithoutTime = DateTime(
      selectedDay?.year ?? DateTime.now().year,
      selectedDay?.month ?? DateTime.now().month,
      selectedDay?.day ?? DateTime.now().day,
    );

    return Scaffold(
      backgroundColor: AppColor.background,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 3, 6),
                    lastDay: DateTime.utc(2030, 3, 6),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDay, day);
                    },
                    onFormatChanged: (format) {
                      if (selectedDay != null) {
                        setState(() {});
                      }
                    },
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Today',
                      CalendarFormat.twoWeeks: 'Today',
                      CalendarFormat.week: 'Today',
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: true,
                      titleTextStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.main),
                    ),
                    calendarStyle: const CalendarStyle(
                        //marker 관련
                        canMarkersOverflow: false,
                        markersAutoAligned: true,
                        markerSize: 10,
                        markerDecoration: BoxDecoration(
                          color: AppColor.purple,
                          shape: BoxShape.circle,
                        ),
                        //today 관련
                        isTodayHighlighted: true,
                        todayDecoration: BoxDecoration(
                          color: AppColor.mainOpacity,
                          shape: BoxShape.circle,
                        ),
                        //selectedDay 관련
                        selectedDecoration: BoxDecoration(
                            color: AppColor.main, shape: BoxShape.circle),
                        //주말 관련
                        weekendTextStyle: TextStyle(color: Colors.red)),
                    onPageChanged: (pageDate) {
                      setState(() {
                        focusedDay = pageDate;
                      });
                    },
                    onDaySelected: (selectedDays, _) {
                      setState(() {
                        selectedDay = selectedDays;
                        focusedDay = selectedDays;
                      });
                      //sendDate(selectedDays);
                      //print('User selected day $selectedDays');
                    },
                  ),
                  Positioned(
                      top: 9,
                      right: 62,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            focusedDay = DateTime.now();
                            selectedDay = DateTime.now();
                          });
                        },
                        child: const Text('  '),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '${selectedDayWithoutTime.year}년 ${selectedDayWithoutTime.month}월 ${selectedDayWithoutTime.day}일',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: context
                      .watch<ScheduleListProvider>()
                      .scheduleListByDate
                      .where((event) =>
                          (event.year ==
                              selectedDayWithoutTime.year.toString()) &&
                          (event.month ==
                              selectedDayWithoutTime.month.toString()) &&
                          (event.day == selectedDayWithoutTime.day.toString()))
                      .map(
                        (event) => Dismissible(
                          key: Key(event.scheduleId.toString()),
                          onDismissed: (direction) {
                            if (event.scheduleId != null) {
                              context
                                  .read<ScheduleListProvider>()
                                  .deleteScheduleList(event.scheduleId!);
                            } else {
                              print('Error: scheduleId is null');
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: Container(
                                  width: 40,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        width: 5.0,
                                        color: AppColor.yellow,
                                      ),
                                    ),
                                  ),
                                  child: Text(event.time ?? '하루종일')),
                              title: Text(
                                event.event,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                event.location,
                                style: const TextStyle(fontSize: 16),
                              ),
                              onTap: () {
                                print(event.scheduleId);
                                TextEditingController eventController =
                                    TextEditingController(text: event.event);
                                TextEditingController yearController =
                                    TextEditingController(text: event.year);
                                TextEditingController monthController =
                                    TextEditingController(
                                        text: selectedDayWithoutTime.month
                                            .toString());
                                TextEditingController dayController =
                                    TextEditingController(
                                        text: selectedDayWithoutTime.day
                                            .toString());
                                TextEditingController locationController =
                                    TextEditingController(text: event.location);
                                TextEditingController timeController =
                                    TextEditingController(text: event.time);

                                showDialog(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: const Text(
                                        'Edit this event',
                                        style: TextStyle(
                                            color: AppColor.main,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: const Text(
                                                  'Event Name',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                subtitle: TextField(
                                                  controller: eventController,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ListTile(
                                                      title: const Text(
                                                        'Year',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      subtitle: TextField(
                                                        controller:
                                                            yearController,
                                                        decoration:
                                                            const InputDecoration(
                                                          enabledBorder:
                                                              UnderlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListTile(
                                                      title: const Text(
                                                        'Month',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      subtitle: TextField(
                                                        controller:
                                                            monthController,
                                                        decoration:
                                                            const InputDecoration(
                                                          enabledBorder:
                                                              UnderlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListTile(
                                                      title: const Text(
                                                        'Day',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      subtitle: TextField(
                                                        controller:
                                                            dayController,
                                                        decoration:
                                                            const InputDecoration(
                                                          enabledBorder:
                                                              UnderlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ListTile(
                                                title: const Text(
                                                  'Time',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                subtitle: TextField(
                                                  controller: timeController,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text(
                                                  'Location',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                subtitle: TextField(
                                                  controller:
                                                      locationController,
                                                  decoration:
                                                      const InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Close'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            Schedule schedule = Schedule(
                                              scheduleId: event.scheduleId,
                                              event: eventController.text,
                                              location: locationController.text,
                                              year: yearController.text,
                                              month: monthController.text,
                                              day: dayController.text,
                                            );
                                            await context
                                                .read<ScheduleListProvider>()
                                                .editScheduleList(schedule);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Apply'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Add Event',
            onTap: () {
              TextEditingController eventController = TextEditingController();
              TextEditingController yearController = TextEditingController(
                  text: selectedDayWithoutTime.year.toString());
              TextEditingController monthController = TextEditingController(
                  text: selectedDayWithoutTime.month.toString());
              TextEditingController dayController = TextEditingController(
                  text: selectedDayWithoutTime.day.toString());
              TextEditingController locationController =
                  TextEditingController();
              TextEditingController timeController = TextEditingController();
              showDialog(
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: const Text(
                      'Add this event',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColor.main,
                          fontWeight: FontWeight.bold),
                    ),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.9,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text(
                                'Event Name',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: TextField(
                                controller: eventController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: const Text(
                                      'Year',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle: TextField(
                                      controller: yearController,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text(
                                      'Month',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle: TextField(
                                      controller: monthController,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text(
                                      'Day',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    subtitle: TextField(
                                      controller: dayController,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                              title: const Text(
                                'Time',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: TextField(
                                controller: timeController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                'Location',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: TextField(
                                controller: locationController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Schedule schedule = Schedule(
                            event: eventController.text,
                            location: locationController.text,
                            year: yearController.text,
                            month: monthController.text,
                            day: dayController.text,
                            time: timeController.text,
                          );
                          await context
                              .read<ScheduleListProvider>()
                              .addScheduleList(schedule);

                          Navigator.pop(context);
                        },
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.chat_bubble_outline),
            label: 'NLP add',
            onTap: () {
              TextEditingController eventController = TextEditingController();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: CupertinoActionSheet(
                      title: Row(
                        children: <Widget>[
                          const Icon(Icons.chat_bubble_outline),
                          const SizedBox(width: 10), // 아이콘과 텍스트 입력 필드 사이의 간격
                          Expanded(
                            child: TextField(
                              controller: eventController,
                              decoration: const InputDecoration(
                                label: Text('Tell me your schedule'),
                                enabledBorder: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text(
                          'Add',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          context
                              .read<ScheduleListProvider>()
                              .addScheduleListByNlp(eventController.text);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.search),
            label: 'Search',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    navigationBar: const CupertinoNavigationBar(
                      middle: Text('Search'), // NavigationBar의 제목을 'Search'로 설정
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 45.0), // 상단 여백 추가
                        Row(
                          // 검색 아이콘, 입력창, 화살표 아이콘
                          children: <Widget>[
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.search,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CupertinoTextField(
                                placeholder: 'Enter search text',
                                controller: _searchController,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: const Icon(Icons.send),
                              onPressed: () {
                                update();
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            children: context
                                .watch<ScheduleListProvider>()
                                .scheduleListByDate
                                .where((event) => event.event
                                    .contains(_searchController.text))
                                .map(
                                  (event) => Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ListTile(
                                        leading: Text(event.time ?? '하루종일'),
                                        title: Text(
                                          event.event,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(event.location),
                                        onTap: () {
                                          setState(() {
                                            _searchController.clear();
                                            Navigator.pop(context);
                                            focusedDay = DateTime(
                                                2023,
                                                int.parse(event.month),
                                                int.parse(event.day));
                                            selectedDay = DateTime(
                                                2023,
                                                int.parse(event.month),
                                                int.parse(event.day));
                                          });
                                        }),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.person),
            label: 'Get My Schedules',
            onTap: () {
              if (student.id != 1) {
                return;
              }

              TextEditingController studentNumberController =
                  TextEditingController();
              TextEditingController nameController = TextEditingController();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: CupertinoActionSheet(
                        title: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Icon(Icons.numbers_rounded),
                                const SizedBox(
                                    width: 10), // 아이콘과 텍스트 입력 필드 사이의 간격
                                Expanded(
                                  child: TextField(
                                    controller: studentNumberController,
                                    decoration: const InputDecoration(
                                      label: Text('학번'),
                                      enabledBorder: UnderlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(Icons.person_outline),
                                const SizedBox(
                                    width: 10), // 아이콘과 텍스트 입력 필드 사이의 간격
                                Expanded(
                                  child: TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      label: Text('이름'),
                                      enabledBorder: UnderlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        cancelButton: Column(
                          children: [
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Log in',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                Student loginStudent = Student(
                                    id: int.parse(studentNumberController.text),
                                    name: nameController.text);
                                bool isLogin =
                                    await ApiService.login(loginStudent);

                                if (isLogin) {
                                  student.setInfo(
                                      int.parse(studentNumberController.text),
                                      nameController.text);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("회원가입을 하지 않으셨나요? "),
                                TextButton(
                                  child: const Text(
                                    '회원가입',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    TextEditingController JoinIDController =
                                        TextEditingController();
                                    TextEditingController JoinNameController =
                                        TextEditingController();

                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return FractionallySizedBox(
                                          heightFactor: 0.7,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: <Widget>[
                                                    TextField(
                                                      controller:
                                                          JoinIDController,
                                                      decoration:
                                                          const InputDecoration(
                                                        label: Text('학번'),
                                                        enabledBorder:
                                                            UnderlineInputBorder(),
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                    ),
                                                    TextField(
                                                      controller:
                                                          JoinNameController,
                                                      decoration:
                                                          const InputDecoration(
                                                        label: Text('이름'),
                                                        enabledBorder:
                                                            UnderlineInputBorder(),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      child: const Text('회원가입'),
                                                      onPressed: () async {
                                                        Student loginStudent = Student(
                                                            id: int.parse(
                                                                JoinIDController
                                                                    .text),
                                                            name:
                                                                JoinNameController
                                                                    .text);
                                                        bool isJoined =
                                                            await ApiService.join(
                                                                loginStudent);

                                                        if (isJoined) {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.home_filled),
            label: 'Go to The HomePage',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
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
            color: AppColor.main,
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Text(message,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
