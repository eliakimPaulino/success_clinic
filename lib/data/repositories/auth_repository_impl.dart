import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<void> register(User user) async {
    await datasource.saveUser(user.email, user.password);
    await datasource.setLoggedIn(true);
  }

  @override
  Future<bool> login(String email, String password) async {
    final stored = await datasource.getUser();
    if (stored['email'] == email && stored['password'] == password) {
      await datasource.setLoggedIn(true);
      return true;
    }
    return false;
  }

  @override
  Future<bool> isLoggedIn() {
    return datasource.isLoggedIn();
  }

  @override
  Future<void> logout() {
    return datasource.logout();
  }
}
