import '../../repositories/i_medico_repository.dart';
import '../../../models/medico.dart';

class ListarMedicos {
  final IMedicoRepository repository;

  ListarMedicos(this.repository);

  Future<List<Medico>> call() async {
    return await repository.buscarTodos();
  }
}
