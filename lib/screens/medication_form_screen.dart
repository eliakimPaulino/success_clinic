import 'package:clinica_exito/models/medicamento.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MedicationFormScreen extends StatefulWidget {
  const MedicationFormScreen({super.key});

  @override
  State<MedicationFormScreen> createState() => _MedicamentoFormScreenState();
}

class _MedicamentoFormScreenState extends State<MedicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  DateTime? _startDate;
  String _interval = '7 dias';
  String? _selectedMedicamentoName;
  String? _selectedMedicamentoDose;

  void _submit(Medicamento medicamento) async {
    if (_formKey.currentState!.validate() && _startDate != null) {
      var box = Hive.box<Medicamento>('medicamentos');
      await box.add(medicamento);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Medicação cadastrada com sucesso!")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Preencha todos os campos")));
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _startDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Medicação")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedMedicamentoName,
                items: ['Tirzepatida', 'Semaglutida']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedMedicamentoName = val;
                    _nameController.text =
                        val!; // Atualiza o campo de nome com a seleção
                  });
                },
                decoration: InputDecoration(labelText: 'Nome da Medicação'),
              ),
              DropdownButtonFormField<String>(
                value: _selectedMedicamentoDose,
                items: ['10 Doses', '20 Doses']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedMedicamentoDose = val;
                  });
                },
                decoration: InputDecoration(labelText: 'Quantidade de Doses'),
              ),
              ListTile(
                title: Text(
                  _startDate == null
                      ? 'Selecione a data inicial'
                      : 'Data: ${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                ),
                trailing: Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              DropdownButtonFormField<String>(
                value: _interval,
                items: ['7 dias', '2x por semana']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _interval = val!),
                decoration: InputDecoration(
                  labelText: 'Intervalo de Aplicação',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submit(
                  Medicamento(
                    nome: _nameController.text,
                    dosagem: _dosageController.text,
                    data: _startDate!,
                    intervalo: _interval,
                  ),
                ),
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
