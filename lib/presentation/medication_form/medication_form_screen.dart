// ignore_for_file: use_build_context_synchronously

import 'package:success_clinic/presentation/controllers/medication_controller.dart';
import 'package:success_clinic/presentation/medication_form/widgets/dosage_dropdown.dart';
import 'package:success_clinic/presentation/medication_form/widgets/interval_dropdown.dart';
import 'package:success_clinic/presentation/medication_form/widgets/medication_dropdown.dart';
import 'package:success_clinic/core/shared/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:success_clinic/models/medicamento.dart';

import '../controllers/doses_per_medication.dart';

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
    final dosesDisponiveis = controller.name != null
        ? (dosesPorMedicamento[controller.name] ?? []).cast<String>()
        : <String>[];
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastrar Medicação")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 24,
            children: [
              const SizedBox(height: 15),
              MedicationDropdown(
                value: controller.name,
                onChanged: (value) => setState(() => controller.name = value),
              ),
              DosageDropdown(
                items: dosesDisponiveis,
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
                    builder: (context, child) {
                      final theme = Theme.of(context);
                      final isDark =
                          Theme.of(context).brightness == Brightness.dark;

                      final colorScheme = isDark
                          ? ColorScheme.dark(
                              primary: theme.colorScheme.primary,
                              onPrimary: Colors.white,
                              surface: const Color(0xFF1E1E1E),
                              onSurface: Colors.white,
                            )
                          : ColorScheme.light(
                              primary: theme.colorScheme.primary,
                              onPrimary: Colors.white,
                              surface: Colors.white,
                              onSurface: Colors.black,
                            );

                      final light = ColorScheme.light(
                        primary: theme.colorScheme.primary,
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: Colors.black,
                      );

                      final dark = ColorScheme.dark(
                        primary: theme.colorScheme.primary,
                        onPrimary: Colors.white,
                        surface: const Color(0xFF1E1E1E),
                        onSurface: Colors.white,
                      );

                      return Theme(
                        data: ThemeData(
                          colorScheme: isDark ? dark : light,
                          dialogTheme: DialogThemeData(
                            backgroundColor: const Color(0xFF1E1E1E),
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: colorScheme.primary,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
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
              const SizedBox(height: 30),
              ElevatedButton(onPressed: _submit, child: const Text("Salvar")),
            ],
          ),
        ),
      ),
    );
  }
}
