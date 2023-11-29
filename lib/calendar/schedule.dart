class Schedule {
  final int? scheduleId;
  final String event, location, month, day;
  final String? time;

  Schedule(
      {this.scheduleId,
      required this.event,
      required this.location,
      required this.month,
      required this.day,
      this.time});

  Map<String, dynamic> toJson() {
    return {
      'id': scheduleId,
      'event': event,
      'location': location,
      'month': month,
      'day': day,
      'time': time,
    };
  }

  Schedule.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        location = json['location'],
        month = json['month'],
        day = json['day'],
        time = json['time'],
        scheduleId = json['id'];
}
