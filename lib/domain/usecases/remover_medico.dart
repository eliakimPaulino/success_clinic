import '../repositories/i_medico_repository.dart';
import '../../models/medico.dart';

class RemoverMedico {
  final IMedicoRepository repository;

  RemoverMedico(this.repository);

  Future<void> call(Medico medico) async {
    await repository.remover(medico);
  }
}
