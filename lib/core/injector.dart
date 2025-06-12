import 'package:clinica_exito/presentation/controllers/medicamento_controller.dart';
import 'package:clinica_exito/presentation/controllers/medico_controller.dart';
import 'package:clinica_exito/domain/repositories/i_medicamento_repository.dart';
import 'package:clinica_exito/data/repositories/hive_medicamento_repository.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../domain/repositories/i_medico_repository.dart';
import '../domain/usecases/doctor/cadastrar_medico_usecase.dart';
import '../domain/usecases/doctor/listar_medico_usecase.dart';
import '../domain/usecases/doctor/remover_medico_usecase.dart';
import '../data/repositories/hive_medico_repository.dart';
import '../models/medico.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  // Abrir as caixas do Hive
  final medicoBox = await Hive.openBox<Medico>('medicos');
  final medicamentoBox = await Hive.openBox<Medicamento>('medicamentos');

  // Repositórios
  getIt.registerSingleton<IMedicoRepository>(HiveMedicoRepository(medicoBox));
  getIt.registerSingleton<IMedicamentoRepository>(
    HiveMedicamentoRepository(medicamentoBox),
  );

  getIt.registerSingleton<MedicamentoController>(
    MedicamentoController(getIt<IMedicamentoRepository>()),
  );

  // Registra os UseCases
  getIt.registerSingleton<ListarMedicos>(ListarMedicos(getIt()));
  getIt.registerSingleton<CadastrarMedico>(CadastrarMedico(getIt()));
  getIt.registerSingleton<RemoverMedico>(RemoverMedico(getIt()));

  // Atualiza o Controller
  getIt.registerSingleton<MedicoController>(
    MedicoController(listar: getIt(), cadastrar: getIt(), remover: getIt()),
  );
}
