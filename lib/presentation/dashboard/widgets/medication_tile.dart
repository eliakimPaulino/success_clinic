import 'package:success_clinic/models/medication_info_model.dart';
import 'package:success_clinic/models/medicamento.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedicationTile extends StatelessWidget {
  Medicamento medication;
  MedicationInfo image;

  MedicationTile({super.key, required this.medication, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.nome,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Aplicado em: ${medication.data.day.toString().padLeft(2, '0')}/${medication.data.month.toString().padLeft(2, '0')}/${medication.data.year}',
                  style: const TextStyle(fontSize: 14),
                ),

                Text(
                  '${medication.dosagem} doses',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image.imagePath,
              width: 100,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
