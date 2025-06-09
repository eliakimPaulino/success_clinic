// import 'dart:math';

import 'package:clinica_exito/models/medico.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final doutores = [
      Medico(
        nome: 'William Rangel',
        especialidade: 'Endocrinologista',
        photo: 'assets/dr_willian_rangel.png',
      ),
      Medico(
        nome: 'Pedro Candelario',
        especialidade: 'Endocrinologista',
        photo: 'assets/pedro_candelario.png',
      ),
      Medico(
        nome: 'Rafael Cardoso',
        especialidade: 'Endocrinologista',
        photo: 'assets/rafael_cardoso.png',
      ),
      Medico(
        nome: 'Yandra Guerra',
        especialidade: 'Nutricionista',
        photo: 'assets/yandra_guera.png',
      ),
      Medico(
        nome: 'Eliana Monoel',
        especialidade: 'Nutricionista',
        photo: 'assets/eliane_manoel.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Médicos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de pesquisa
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Pesquisar',
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Doutores",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: doutores.length,
                itemBuilder: (context, index) {
                  final doutor = doutores[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(doutor.photo!),
                    ),
                    title: Text(doutor.nome),
                    subtitle: Text(
                      doutor.especialidade,
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
