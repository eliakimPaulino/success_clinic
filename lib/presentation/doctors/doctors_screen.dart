import 'package:success_clinic/presentation/doctors/data/dummy_doctors.dart';
import 'package:success_clinic/presentation/doctors/widgets/doctor_tile.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Médicos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Implementar funcionalidade de adicionar médico
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de pesquisa (ainda visual, pode ser funcional depois)
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
                itemCount: dummyDoctors.length,
                itemBuilder: (context, index) {
                  return DoctorTile(medico: dummyDoctors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
