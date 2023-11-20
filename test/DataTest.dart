import 'package:causw_graduate/GraduateDB/UserData/UserData.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('SharedPreferences Test', () async {
    SharedPreferences.setMockInitialValues({});

    UserData userData = UserData();
    await userData.initialize();
    print(userData.majorSubjects.list);
  });
}
