import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<bool> register(User user) async {
    final userExists = await datasource.userExists(user.email);

    if (userExists) {
      return false;
    }

    await datasource.saveUser(user.email, user.password, user.name);
    await datasource.setLoggedIn(true);
    return true;
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
  Future<void> logout() async {
    await datasource.setLoggedIn(false);
    return datasource.logout();
  }

  @override
  Future<String?> getCurrentUserName() async {
    final data = await datasource.getUser();
    return data['name'];
  }
}
