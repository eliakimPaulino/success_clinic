import 'package:success_clinic/domain/usecases/doctor/listar_medico_usecase.dart';
import 'package:success_clinic/models/medico.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mocks/fake_medico_repository.dart';

void main() {
  test('Deve listar todos os médicos do repositório', () async {
    final repo = FakeMedicoRepository();
    repo.adicionar(Medico(nome: 'Dr. A', especialidade: 'Ortopedia'));
    repo.adicionar(Medico(nome: 'Dra. B', especialidade: 'Pediatria'));

    final listarMedicos = ListarMedicos(repo);

    final medicos = await listarMedicos();
    expect(medicos.length, 2);
    expect(medicos[1].nome, 'Dra. B');
  });
}
