import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalAuthDatasource {
  Future<void> saveUser(String email, String password);
  Future<Map<String, String?>> getUser();
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
  Future<void> logout();
  Future<bool> userExists(String email);

}

class LocalAuthDatasourceImpl implements LocalAuthDatasource {
  @override
  Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email'),
      'password': prefs.getString('password'),
    };
  }

  @override
  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }

  @override
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  @override
Future<bool> userExists(String email) async {
  final box = await Hive.openBox('authBox');
  return box.containsKey(email);
}

}
