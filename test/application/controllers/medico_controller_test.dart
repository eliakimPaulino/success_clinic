import 'package:clinica_exito/application/controllers/medico_controller.dart';
import 'package:clinica_exito/domain/usecases/cadastrar_medico.dart';
import 'package:clinica_exito/domain/usecases/listar_medico.dart';
import 'package:clinica_exito/domain/usecases/remover_medico.dart';
import 'package:clinica_exito/models/medico.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/fake_medico_repository.dart';

void main() {
  test('Controller deve adicionar e listar médicos corretamente', () async {
    final repo = FakeMedicoRepository();

    final controller = MedicoController(
      listar: ListarMedicos(repo),
      cadastrar: CadastrarMedico(repo),
      remover: RemoverMedico(repo),
    );

    final medico = Medico(nome: 'Dr. Lucas', especialidade: 'Dermatologia');

    await controller.adicionar(medico);
    expect(controller.medicos.length, 1);
    expect(controller.medicos.first.nome, 'Dr. Lucas');
  });
}
