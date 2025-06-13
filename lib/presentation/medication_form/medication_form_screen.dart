// ignore_for_file: use_build_context_synchronously

import 'package:clinica_exito/presentation/controllers/medication_controller.dart';
import 'package:clinica_exito/presentation/medication_form/widgets/dosage_dropdown.dart';
import 'package:clinica_exito/presentation/medication_form/widgets/interval_dropdown.dart';
import 'package:clinica_exito/presentation/medication_form/widgets/medication_dropdown.dart';
import 'package:clinica_exito/core/shared/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:clinica_exito/models/medicamento.dart';

class MedicationFormScreen extends StatefulWidget {
  const MedicationFormScreen({super.key});

  @override
  State<MedicationFormScreen> createState() => _MedicationFormScreenState();
}

class _MedicationFormScreenState extends State<MedicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final controller = MedicationFormController();

  void _submit() async {
    if (_formKey.currentState!.validate() && controller.startDate != null) {
      final box = Hive.box<Medicamento>('medicamentos');
      await box.add(controller.toMedicamento());
      showCustomSnackBar(context, 'Medicação cadastrada com sucesso!');
      Navigator.pop(context);
    } else {
      showCustomSnackBar(context, 'Preencha todos os campos corretamente.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastrar Medicação")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              MedicationDropdown(
                value: controller.name,
                onChanged: (value) => setState(() => controller.name = value),
              ),
              DosageDropdown(
                value: controller.dose,
                onChanged: (value) => setState(() => controller.dose = value),
              ),
              ListTile(
                title: Text(
                  controller.startDate == null
                      ? 'Selecione a data inicial'
                      : 'Data: ${controller.startDate!.day}/${controller.startDate!.month}/${controller.startDate!.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() => controller.startDate = picked);
                  }
                },
              ),
              IntervalDropdown(
                value: controller.interval,
                onChanged: (value) =>
                    setState(() => controller.interval = value!),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
