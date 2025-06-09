import 'package:flutter/material.dart';

class MedicationDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const MedicationDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: ['Tirzepatida', 'Semaglutida']
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) =>
          value == null ? 'Selecione uma medicação' : null,
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: 'Nome da Medicação'),
    );
  }
}
