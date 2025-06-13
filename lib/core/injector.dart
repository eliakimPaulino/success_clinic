import 'package:clinica_exito/presentation/controllers/medicamento_controller.dart';
import 'package:clinica_exito/presentation/controllers/medico_controller.dart';
import 'package:clinica_exito/domain/repositories/i_medicamento_repository.dart';
import 'package:clinica_exito/data/repositories/hive_medicamento_repository.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../data/datasources/local_auth_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/i_medico_repository.dart';
import '../domain/usecases/doctor/cadastrar_medico_usecase.dart';
import '../domain/usecases/doctor/listar_medico_usecase.dart';
import '../domain/usecases/doctor/remover_medico_usecase.dart';
import '../data/repositories/hive_medico_repository.dart';
import '../domain/usecases/login/check_login_usecase.dart';
import '../domain/usecases/login/get_currente_user_name.dart';
import '../domain/usecases/login/login_usecase.dart';
import '../domain/usecases/login/logout_usecase.dart';
import '../domain/usecases/login/register_usecase.dart';
import '../models/medico.dart';
import '../presentation/controllers/auth_controller.dart';



final getIt = GetIt.instance;

Future<void> setupInjector() async {
   // --- seu código existente para abrir Hive e registrar médicos/medicações ---
  final medicoBox = await Hive.openBox<Medico>('medicos');
  final medicamentoBox = await Hive.openBox<Medicamento>('medicamentos');

  // Repositórios de médico/medicação…
  getIt.registerSingleton<IMedicoRepository>(HiveMedicoRepository(medicoBox));
  getIt.registerSingleton<IMedicamentoRepository>(
    HiveMedicamentoRepository(medicamentoBox),
  );
  getIt.registerSingleton<MedicamentoController>(
    MedicamentoController(getIt()),
  );
  getIt.registerSingleton<ListarMedicos>(ListarMedicos(getIt()));
  getIt.registerSingleton<CadastrarMedico>(CadastrarMedico(getIt()));
  getIt.registerSingleton<RemoverMedico>(RemoverMedico(getIt()));
  getIt.registerSingleton<MedicoController>(
    MedicoController(
      listar: getIt(),
      cadastrar: getIt(),
      remover: getIt(),
    ),
  );

  // --- agora a parte de AUTENTICAÇÃO ---

  // 1) DataSource
  getIt.registerLazySingleton<LocalAuthDatasource>(
    () => LocalAuthDatasourceImpl(),
  );

  // 2) Repository (registre pela interface, não pela impl)
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<LocalAuthDatasource>()),
  );

  // 3) Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<CheckLoginUseCase>(
    () => CheckLoginUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(getIt<AuthRepository>()),
  );

  // 4) Controller
  getIt.registerLazySingleton<AuthController>(
    () => AuthController(
      loginUseCase: getIt<LoginUseCase>(),
      getNameUseCase: getIt<GetCurrentUserNameUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      checkLoginUseCase: getIt<CheckLoginUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
    ),
  );

  getIt.registerLazySingleton<GetCurrentUserNameUseCase>(
    () => GetCurrentUserNameUseCase(getIt<AuthRepository>()),
  );
}
