import '../../domain/entities/user.dart';
import '../../domain/usecases/login/check_login_usecase.dart';
import '../../domain/usecases/login/login_usecase.dart';
import '../../domain/usecases/login/register_usecase.dart';


class AuthController {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final CheckLoginUseCase checkLoginUseCase;

  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.checkLoginUseCase,
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
}
