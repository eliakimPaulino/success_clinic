import 'package:flutter/material.dart';
import 'package:clinica_exito/models/medico.dart';

class DoctorTile extends StatelessWidget {
  final Medico medico;

  const DoctorTile({super.key, required this.medico});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(medico.photo!),
      ),
      title: Text(medico.nome),
      subtitle: Text(
        medico.especialidade,
        style: const TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
