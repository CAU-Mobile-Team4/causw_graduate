import 'dart:convert';
import 'package:causw_graduate/schedule.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://3.36.30.78:8080';

  //일정 반환
  static Future<List<Schedule>> getSchedules(int studentID) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }
    final List<dynamic> schedules = jsonDecode(utf8.decode(response.bodyBytes));
    List<Schedule> scheduleInstances =
        schedules.map((schedule) => Schedule.fromJson(schedule)).toList();
    return scheduleInstances;
  }

//일정 추가(nlp)
  static Future<bool> addScheduleByNlp(int studentID, String statement) async {
    final url = Uri.parse('$baseUrl/schedule/nlp/$studentID');
    final body = {"text": statement};
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));

    if (response.statusCode != 200) {
      print(response.statusCode);
      return false;
    }
    return true;
  }

  //일정 추가
  static Future<bool> addSchedule(int studentID, Schedule schedule) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID');
    final body = jsonEncode(schedule);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  //일정 수정
  static Future<bool> editSchedule(int scheduleID, Schedule schedule) async {
    final url = Uri.parse('$baseUrl/schedule/$scheduleID');
    final body = jsonEncode(schedule.toJson());
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      return false;
    }
    return true;
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
  static Future<bool> deleteSchedules(int studentID, int scheduleID) async {
    final url = Uri.parse('$baseUrl/schedule/$studentID/$scheduleID');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }
}
