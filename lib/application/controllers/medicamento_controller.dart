import 'package:clinica_exito/domain/repositories/i_medicamento_repository.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:flutter/material.dart';

// This controller manages the list of doctors, allowing to load, add, and remove doctors.
// It uses the repository to perform operations and notifies listeners when the list changes.

class MedicamentoController extends ChangeNotifier {
  final IMedicamentoRepository repository;

  List<Medicamento> _medmedicamentos = [];
  List<Medicamento> get medicamentos => _medmedicamentos;

  MedicamentoController(this.repository);

  Future<void> carregarMedicamento() async {
    _medmedicamentos = await repository.buscarTodos();
    notifyListeners();
  }

  Future<void> adicionar(Medicamento medicamento) async {
    await repository.adicionar(medicamento);
    await carregarMedicamento();
  }

  Future<void> remover(Medicamento medicamento) async {
    await repository.remover(medicamento);
    await carregarMedicamento();
  }
}
