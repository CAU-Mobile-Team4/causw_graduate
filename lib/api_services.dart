import 'dart:convert';
import 'package:causw_graduate/schedule.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8080';

  //일정 반환
  static Future<List<Schedule>> getSchedules(int studentID) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    final List<dynamic> schedules = jsonDecode(response.body);
    List<Schedule> scheduleInstances =
        schedules.map((schedule) => Schedule.fromJson(schedule)).toList();
    return scheduleInstances;
  }

//일정 추가(nlp)
  static void addScheduleByNlp(int studentID, String statement) async {
    final url = Uri.parse('$baseUrl/schedule/nlp/$studentID');
    final response = await http.post(url, body: statement);

    if (response.statusCode != 200) {
      throw Error();
    }
    return;
  }

  //일정 추가
  static void addSchedule(int studentID, Schedule schedule) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID');
    final body = jsonEncode(schedule);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      throw Error();
    }
    return;
  }

  //일정 수정
  static void editSchedule(int studentID, Schedule schedule) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID');
    final body = jsonEncode(schedule);
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      throw Error();
    }
    return;
  }

  //일정 검색
  static Future<List<Schedule>> searchSchedules(
      int studentID, String keyword) async {
    final url = Uri.parse('$baseUrl/schedule/search/$studentID');

    final response = await http.post(url, body: keyword);
    if (response.statusCode != 200) {
      throw Error();
    }
    final List<dynamic> schedules = jsonDecode(response.body);
    List<Schedule> scheduleInstances =
        schedules.map((schedule) => Schedule.fromJson(schedule)).toList();
    return scheduleInstances;
  }

  //일정 삭제
  static void deleteSchedules(int studentID, int scheduleID) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID/$scheduleID');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    return;
  }
}
