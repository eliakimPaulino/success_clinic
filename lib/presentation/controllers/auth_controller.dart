import '../../domain/entities/user.dart';
import '../../domain/usecases/login/check_login_usecase.dart';
import '../../domain/usecases/login/get_currente_user_name.dart';
import '../../domain/usecases/login/login_usecase.dart';
import '../../domain/usecases/login/logout_usecase.dart';
import '../../domain/usecases/login/register_usecase.dart';


class AuthController {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final CheckLoginUseCase checkLoginUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserNameUseCase getNameUseCase;

  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.checkLoginUseCase,
    required this.logoutUseCase,
    required this.getNameUseCase,
  });

  Future<bool> login(String email, String password) {
    return loginUseCase(email, password);
  }

  Future<bool> register(User user) {
    return registerUseCase(user);
  }

  Future<bool> isLoggedIn() {
    return checkLoginUseCase();
  }

  Future<String?> getCurrentUserName() => getNameUseCase();

  Future<void> logout() {
    return logoutUseCase();
  }
}
