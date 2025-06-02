import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MedicationFormScreen extends StatefulWidget {
  const MedicationFormScreen({super.key});

  @override
  State<MedicationFormScreen> createState() => _MedicationFormScreenState();
}

class _MedicationFormScreenState extends State<MedicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  DateTime? _startDate;
  String _interval = '7 dias';
  String? _selectedMedicationName;

  void _submit(Medication medication) async {
    if (_formKey.currentState!.validate() && _startDate != null) {
      var box = Hive.box<Medication>('remedios');
      await box.add(medication);
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
      lastDate: DateTime(2030),
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
                value: _selectedMedicationName,
                items: ['Tirzepatida', 'Metformina', 'Semaglutida']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedMedicationName = val;
                    _nameController.text =
                        val!; // Atualiza o campo de nome com a seleção
                  });
                },
                decoration: InputDecoration(labelText: 'Nome da Medicação'),
              ),
              TextFormField(
                controller: _dosageController,
                decoration: InputDecoration(labelText: 'Dosagem'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
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
                  Medication(
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
