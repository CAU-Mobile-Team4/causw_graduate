import 'package:flutter/material.dart';
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
  bool checked1 = false;
  bool checked2 = false;



  Map<DateTime, List<String>> events = {
    DateTime(2023, 11, 14): ['Mid-term Exam', 'Study Group'],
    DateTime(2023, 11, 15): ['Mid-term 12Exam', 'Study Group'],
    DateTime(2023, 11, 16): ['Mid-term Exam', 'Study Group'],
    DateTime(2023, 11, 17): ['Mid-term 12Exam', 'Study Group'],
    DateTime(2023, 11, 13):['Test','Testing','dmd'],
    // 추가적인 일정...
  };

  void addEvent(DateTime date, String event) {
    if (events[date] != null) {
      // 날짜가 이미 존재하는 경우, 이벤트 리스트에 추가
      events[date]?.add(event);
    } else {
      // 날짜가 존재하지 않는 경우, 새로운 리스트를 생성하고 이벤트 추가
      events[date] = [event];
    }
  }
  TextEditingController _dateController = TextEditingController();
  TextEditingController _eventController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    DateTime selectedDayWithoutTime = DateTime(
      selectedDay?.year ?? DateTime.now().year,
      selectedDay?.month ?? DateTime.now().month,
      selectedDay?.day ?? DateTime.now().day,
    );
    return Scaffold(
      body: GestureDetector(onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
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
                ),
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
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: events[selectedDayWithoutTime]?.map((event) {
                    return ListTile(
                      title: Text(event),
                    );
                  }).toList() ?? [],
                ),
              ),
            ),
          )
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Event'),
                content: Column(
                  children: [
                    TextField(
                      controller: _dateController,
                      decoration: InputDecoration(hintText: 'Enter date (yyyy-mm-dd)'),
                    ),
                    TextField(
                      controller: _eventController,
                      decoration: InputDecoration(hintText: 'Enter event'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      DateTime date = DateTime.parse(_dateController.text);
                      String event = _eventController.text;
                      addEvent(date, event);
                      Navigator.of(context).pop();

                      // Clear the text fields for the next input.
                      _dateController.clear();
                      _eventController.clear();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}