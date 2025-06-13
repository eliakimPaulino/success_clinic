import 'package:clinica_exito/domain/usecases/login/get_currente_user_name.dart';
import 'package:clinica_exito/domain/usecases/login/logout_usecase.dart';

import '../../data/datasources/local_auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login/check_login_usecase.dart';
import '../../domain/usecases/login/login_usecase.dart';
import '../../domain/usecases/login/register_usecase.dart';
import '../../presentation/controllers/auth_controller.dart';

AuthController injectAuthController() {
  final datasource = LocalAuthDatasourceImpl();
  final repository = AuthRepositoryImpl(datasource);

  return AuthController(
    loginUseCase: LoginUseCase(repository),
    registerUseCase: RegisterUseCase(repository),
    checkLoginUseCase: CheckLoginUseCase(repository),
    logoutUseCase: LogoutUseCase(repository),
    getNameUseCase: GetCurrentUserNameUseCase(repository),
  );
}
