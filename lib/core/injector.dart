import 'package:clinica_exito/application/controllers/medicamento_controller.dart';
import 'package:clinica_exito/application/controllers/medico_controller.dart';
import 'package:clinica_exito/domain/repositories/i_medicamento_repository.dart';
import 'package:clinica_exito/infrastructure/repositories/hive_medicamento_repository.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../domain/repositories/i_medico_repository.dart';
import '../infrastructure/repositories/hive_medico_repository.dart';
import '../models/medico.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  // Abrir as caixas do Hive
  final medicoBox = await Hive.openBox<Medico>('medicos');
  final medicamentoBox = await Hive.openBox<Medicamento>('medicamentos');

  // Repositórios
  getIt.registerSingleton<IMedicoRepository>(HiveMedicoRepository(medicoBox));
  getIt.registerSingleton<IMedicamentoRepository>(HiveMedicamentoRepository(medicamentoBox));

  // Pode registrar outros da mesma forma:
  getIt.registerSingleton<MedicoController>(
    MedicoController(getIt<IMedicoRepository>()),
  );

  getIt.registerSingleton<MedicamentoController>(
    MedicamentoController(getIt<IMedicamentoRepository>()),
  );
}
