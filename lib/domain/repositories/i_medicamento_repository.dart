import 'package:clinica_exito/models/medicamento.dart';

// A interface diz o que fazer, mas não como. Ideal para isolar a camada de domínio.

abstract class IMedicamentoRepository {
  Future<void> adicionar(Medicamento medicamento);
  Future<List<Medicamento>> buscarTodos();
  Future<void> remover(Medicamento medicamento);
}
