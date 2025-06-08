import '../../models/medico.dart';

// A interface diz o que fazer, mas não como. Ideal para isolar a camada de domínio.

abstract class IMedicoRepository {
  Future<void> adicionar(Medico medico);
  Future<List<Medico>> buscarTodos();
  Future<void> remover(Medico medico);
}
