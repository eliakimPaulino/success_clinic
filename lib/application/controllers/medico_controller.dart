import 'package:flutter/material.dart';
import '../../domain/repositories/i_medico_repository.dart';
import '../../models/medico.dart';

// This controller manages the list of doctors, allowing to load, add, and remove doctors.
// It uses the repository to perform operations and notifies listeners when the list changes.

class MedicoController extends ChangeNotifier {
  final IMedicoRepository repository;

  List<Medico> _medicos = [];
  List<Medico> get medicos => _medicos;

  MedicoController(this.repository);

  Future<void> carregarMedicos() async {
    _medicos = await repository.buscarTodos();
    notifyListeners();
  }

  Future<void> adicionar(Medico medico) async {
    await repository.adicionar(medico);
    await carregarMedicos();
  }

  Future<void> remover(Medico medico) async {
    await repository.remover(medico);
    await carregarMedicos();
  }
}
