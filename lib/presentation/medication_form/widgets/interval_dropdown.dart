import 'package:flutter/material.dart';

class IntervalDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const IntervalDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: ['7 dias', '2x por semana']
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
      decoration:
          const InputDecoration(labelText: 'Intervalo de Aplicação'),
    );
  }
}
