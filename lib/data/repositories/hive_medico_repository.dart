import 'package:hive/hive.dart';
import '../../domain/repositories/i_medico_repository.dart';
import '../../models/medico.dart';

// essa classe é responsável por persistir os dados dos médicos usando o Hive. Se outra classe quiser persistir os dados de outra forma, basta implementar a interface IMedicoRepository.
class HiveMedicoRepository implements IMedicoRepository {
  final Box<Medico> _box;

  HiveMedicoRepository(this._box);

  @override
  Future<void> adicionar(Medico medico) async {
    await _box.add(medico);
  }

  @override
  Future<List<Medico>> buscarTodos() async {
    return _box.values.toList();
  }

  @override
  Future<void> remover(Medico medico) async {
    final key = _box.keys.firstWhere((k) => _box.get(k) == medico, orElse: () => null);
    if (key != null) {
      await _box.delete(key);
    }
  }
}

// chamada na tela: final IMedicoRepository medicoRepo = HiveMedicoRepository(Hive.box<Medico>('medicos'));
// ex de aplicação: await medicoRepo.adicionar(Medico(nome: 'Dr. Lucas', especialidade: 'Ortopedista'));

/* Mock para testar lógica na tela, sem persistência real. Útil para testes unitários ou desenvolvimento inicial:

import '../../domain/repositories/i_medico_repository.dart';

class FakeMedicoRepository implements IMedicoRepository {
  final List<Medico> _lista = [];

  @override
  Future<void> adicionar(Medico medico) async => _lista.add(medico);

  @override
  Future<List<Medico>> buscarTodos() async => _lista;

  @override
  Future<void> remover(Medico medico) async => _lista.remove(medico);
}

*/