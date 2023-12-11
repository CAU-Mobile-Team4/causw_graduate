class Schedule {
  final int? scheduleId;
  final String event, location, year, month, day;
  final String? time;

  Schedule(
      {this.scheduleId,
      required this.event,
      required this.location,
      required this.year,
      required this.month,
      required this.day,
      this.time});

  Map<String, dynamic> toJson() {
    return {
      'id': scheduleId,
      'event': event,
      'location': location,
      'year': year,
      'month': month,
      'day': day,
      'time': time,
    };
  }

  Schedule.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        location = json['location'],
        year = json['year'] ?? '2023',
        month = json['month'],
        day = json['day'],
        time = json['time'],
        scheduleId = json['id'];
}
