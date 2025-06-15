import 'package:success_clinic/domain/usecases/doctor/cadastrar_medico_usecase.dart';
import 'package:success_clinic/domain/usecases/doctor/listar_medico_usecase.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/doctor/remover_medico_usecase.dart';
import '../../models/medico.dart';

// This controller manages the list of doctors, allowing to load, add, and remove doctors.
// It uses the repository to perform operations and notifies listeners when the list changes.

class MedicoController extends ChangeNotifier {
  final ListarMedicos listar;
  final CadastrarMedico cadastrar;
  final RemoverMedico remover;

  List<Medico> _medicos = [];
  List<Medico> get medicos => _medicos;

  MedicoController({
    required this.listar,
    required this.cadastrar,
    required this.remover,
  });

  Future<void> carregarMedicos() async {
    _medicos = await listar();
    notifyListeners();
  }

  Future<void> adicionar(Medico medico) async {
    await cadastrar(medico);
    await carregarMedicos();
  }

  Future<void> excluir(Medico medico) async {
    await remover(medico);
    await carregarMedicos();
  }
}
