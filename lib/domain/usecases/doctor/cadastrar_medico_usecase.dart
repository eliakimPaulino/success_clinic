import '../../repositories/i_medico_repository.dart';
import '../../../models/medico.dart';

class CadastrarMedico {
  final IMedicoRepository repository;

  CadastrarMedico(this.repository);

  Future<void> call(Medico medico) async {
    await repository.adicionar(medico);
  }
}
