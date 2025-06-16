import 'package:flutter/material.dart';

class DosageDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final List<String> items;

  const DosageDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      validator: (value) => value == null ? 'Selecione uma dose' : null,
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: 'Quantidade de Doses'),
    );
  }
}
