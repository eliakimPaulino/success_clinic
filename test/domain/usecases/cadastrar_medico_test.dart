import 'package:success_clinic/domain/usecases/doctor/cadastrar_medico_usecase.dart';
import 'package:success_clinic/models/medico.dart';
import 'package:flutter_test/flutter_test.dart';


import '../../mocks/fake_medico_repository.dart';

void main() {
  test('Deve adicionar um médico no repositório', () async {
    final repo = FakeMedicoRepository();
    final useCase = CadastrarMedico(repo);

    final medico = Medico(nome: 'Dr. João', especialidade: 'Cardiologia');

    await useCase(medico);

    final lista = await repo.buscarTodos();
    expect(lista.length, 1);
    expect(lista.first.nome, 'Dr. João');
  });
}
