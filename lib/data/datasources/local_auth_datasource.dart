import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalAuthDatasource {
  Future<void> saveUser(String name, String email, String password);
  Future<Map<String, String>?> getUserByEmail(String email);
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
  Future<void> logout();
  Future<bool> userExists(String email);
  Future<Map<String, String>?> getLoggedInUser();
}

class LocalAuthDatasourceImpl implements LocalAuthDatasource {
  @override
  Future<void> saveUser(String name, String email, String password) async {
    final box = await Hive.openBox('authBox');
    await box.put(email, {'name': name, 'email': email, 'password': password});
  }

  Future<List<Map<String, String>>> getAllUsers() async {
    final box = await Hive.openBox('authBox');
    return box.values
        .map<Map<String, String>>((user) => Map<String, String>.from(user))
        .toList();
  }

  @override
  Future<Map<String, String>?> getUserByEmail(String email) async {
    final box = await Hive.openBox('authBox');
    final user = box.get(email);
    if (user is Map) {
      // Garante que todos os valores são String e não nulos
      return user.map<String, String>(
        (key, value) => MapEntry(key.toString(), value?.toString() ?? ''),
      );
    }
    return null;
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

  Future<Map<String, String>?> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('loggedInEmail');
    if (email == null) return null;
    return getUserByEmail(email);
  }
}
