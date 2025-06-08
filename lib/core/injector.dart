import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../domain/repositories/i_medico_repository.dart';
import '../infrastructure/repositories/hive_medico_repository.dart';
import '../models/medico.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  // Abrir as caixas do Hive
  final medicoBox = await Hive.openBox<Medico>('medicos');

  // Repositórios
  getIt.registerSingleton<IMedicoRepository>(
    HiveMedicoRepository(medicoBox),
  );

  // Você pode registrar outros da mesma forma:
  // getIt.registerSingleton<IMedicamentoRepository>(
  //   HiveMedicamentoRepository(await Hive.openBox<Medicamento>('medicamentos')),
  // );
}
