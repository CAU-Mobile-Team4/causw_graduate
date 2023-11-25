import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/schedule.dart';
import 'package:causw_graduate/schedule_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  late List<Schedule> events;

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<ScheduleListProvider>().updateScheduleList(1);
  }

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDayWithoutTime = DateTime(
      selectedDay?.year ?? DateTime.now().year,
      selectedDay?.month ?? DateTime.now().month,
      selectedDay?.day ?? DateTime.now().day,
    );

    return Scaffold(
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
                            fontSize: 23,
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
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView(
                    children: context
                        .watch<ScheduleListProvider>()
                        .scheduleListByDate
                        .where((event) =>
                            (event.month ==
                                selectedDayWithoutTime.month.toString()) &&
                            (event.day ==
                                selectedDayWithoutTime.day.toString()))
                        .map(
                          (event) => Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
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
                                TextEditingController eventController =
                                    TextEditingController(text: event.event);
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

                                showDialog(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: const Text('Edit this event'),
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: const Text(
                                                  'Event Name',
                                                  style:
                                                      TextStyle(fontSize: 16),
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
                                                        'Month',
                                                        style: TextStyle(
                                                            fontSize: 16),
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
                                                            fontSize: 16),
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
                                                  'Location',
                                                  style:
                                                      TextStyle(fontSize: 16),
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
                                              month: monthController.text,
                                              day: dayController.text,
                                            );
                                            await context
                                                .read<ScheduleListProvider>()
                                                .editScheduleList(schedule);
                                            await context
                                                .read<ScheduleListProvider>()
                                                .updateScheduleList(1);

                                            Navigator.of(context).pop();
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
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: CupertinoActionSheet(
                        title: const Text('Add Event'),
                        message: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                DateTime? chosenDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021),
                                  lastDate: DateTime(2025),
                                );
                                if (chosenDate != null) {
                                  _dateController.text =
                                      chosenDate.toString().substring(0, 10);
                                }
                              },
                              child: AbsorbPointer(
                                child: CupertinoTextField(
                                  controller: _dateController,
                                  placeholder: 'Tap to choose date',
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CupertinoTextField(
                              controller: _eventController,
                              placeholder: 'Enter event',
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('Add'),
                          onPressed: () {
                            // Clear the text fields for the next input.
                            _dateController.clear();
                            _eventController.clear();
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.chat_bubble_outline),
              label: 'NLP add',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: CupertinoActionSheet(
                        title: const Row(
                          children: <Widget>[
                            Icon(Icons.chat_bubble_outline),
                            SizedBox(width: 10), // 아이콘과 텍스트 입력 필드 사이의 간격
                            Expanded(
                              child: CupertinoTextField(
                                placeholder: 'Enter text',
                              ),
                            ),
                          ],
                        ),
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('Add'),
                          onPressed: () {
                            // 아무런 동작을 수행하지 않습니다.
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
                        middle:
                            Text('Search'), // NavigationBar의 제목을 'Search'로 설정
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
                              const Expanded(
                                child: CupertinoTextField(
                                  placeholder: 'Enter search text',
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Icon(Icons.send),
                                onPressed: () {
                                  // 'send' 아이콘을 눌렀을 때의 동작을 여기에 작성
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                              20, (index) => 'Test $index')
                                          .map((event) {
                                        return ListTile(
                                          title: Text(event),
                                        );
                                      }).toList() ??
                                      [],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ));
  }
}

class InputWidget extends StatelessWidget {
  String title;
  TextEditingController controller;

  InputWidget({
    required this.title,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: TextField(
        controller: controller,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(),
        ),
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
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}