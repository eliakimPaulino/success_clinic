import 'package:clinica_exito/domain/repositories/i_medicamento_repository.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:hive/hive.dart';

// essa classe é responsável por persistir os dados dos medicamentos usando o Hive. Se outra classe quiser persistir os dados de outra forma, basta implementar a interface IMedicoRepository.
class HiveMedicamentoRepository implements IMedicamentoRepository {
  final Box<Medicamento> _box;

  HiveMedicamentoRepository(this._box);

  @override
  Future<void> adicionar(Medicamento medicamento) async {
    await _box.add(medicamento);
  }

  @override
  Future<List<Medicamento>> buscarTodos() async {
    return _box.values.toList();
  }

  @override
  Future<void> remover(Medicamento medicamento) async {
    final key = _box.keys.firstWhere((k) => _box.get(k) == medicamento, orElse: () => null);
    if (key != null) {
      await _box.delete(key);
    }
  }
}
