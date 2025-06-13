import '../entities/user.dart';

abstract class AuthRepository {
  Future<void> register(User user);
  Future<bool> login(String email, String password);
  Future<bool> isLoggedIn();
  Future<void> logout();
}
