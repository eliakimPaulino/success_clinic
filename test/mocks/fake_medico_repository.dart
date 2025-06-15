

import 'package:success_clinic/domain/repositories/i_medico_repository.dart';
import 'package:success_clinic/models/medico.dart';

class FakeMedicoRepository implements IMedicoRepository {
  final List<Medico> _data = [];

  @override
  Future<void> adicionar(Medico medico) async {
    _data.add(medico);
  }

  @override
  Future<List<Medico>> buscarTodos() async {
    return _data;
  }

  @override
  Future<void> remover(Medico medico) async {
    _data.removeWhere((m) => m.nome == medico.nome);
  }
}
