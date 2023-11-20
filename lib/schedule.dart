class Schedule {
  final int scheduleId;
  final String event, location, month, day, time;

  Schedule.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        location = json['location'],
        month = json['month'],
        day = json['day'],
        time = json['time'],
        scheduleId = json['scheduleId'];
}
