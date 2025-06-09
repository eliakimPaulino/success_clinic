import 'package:clinica_exito/domain/repositories/i_medicamento_repository.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:flutter/material.dart';

// This controller manages the list of doctors, allowing to load, add, and remove doctors.
// It uses the repository to perform operations and notifies listeners when the list changes.

class MedicamentoController extends ChangeNotifier {
  final IMedicamentoRepository repository;

  List<Medicamento> _medicamentos = [];
  List<Medicamento> get medicamentos => _medicamentos;

  MedicamentoController(this.repository);

  Future<void> carregarMedicamentos() async {
    _medicamentos = await repository.buscarTodos();
    notifyListeners();
  }

  Future<void> adicionar(Medicamento medicamento) async {
    await repository.adicionar(medicamento);
    await carregarMedicamentos();
  }

  Future<void> remover(Medicamento medicamento) async {
    await repository.remover(medicamento);
    await carregarMedicamentos();
  }
}
