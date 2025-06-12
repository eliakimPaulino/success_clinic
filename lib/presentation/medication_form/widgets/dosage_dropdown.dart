import 'package:flutter/material.dart';

class DosageDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const DosageDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: ['10', '20']
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) => value == null ? 'Selecione uma dose' : null,
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: 'Quantidade de Doses'),
    );
  }
}
