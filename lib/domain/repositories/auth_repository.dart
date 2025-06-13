import '../entities/user.dart';

abstract class AuthRepository {
  Future<bool> register(User user);
  Future<bool> login(String email, String password);
  Future<String?> getCurrentUserName();
  Future<bool> isLoggedIn();
  Future<void> logout();
}
