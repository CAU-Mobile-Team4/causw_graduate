class Schedule {
  final int? scheduleId;
  final String event, location, month, day, time;

  Schedule(
      {this.scheduleId,
      required this.event,
      required this.location,
      required this.month,
      required this.day,
      required this.time});

  Schedule.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        location = json['location'],
        month = json['month'],
        day = json['day'],
        time = json['time'],
        scheduleId = json['scheduleId'];
}
