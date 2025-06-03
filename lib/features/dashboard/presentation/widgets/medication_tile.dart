import 'package:clinica_exito/features/medication/data/medication_info_model.dart';
import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedicationTile extends StatelessWidget {
  Medication medication;
  MedicationInfo image;

  MedicationTile({
    super.key,
    required this.medication,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Primeira aplicação: ${medication.data.day.toString().padLeft(2, '0')}/${medication.data.month.toString().padLeft(2, '0')}/${medication.data.year}',
                  style: const TextStyle(fontSize: 14, color: Colors.white54),
                ),
                Text(
                  medication.nome,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${medication.dosagem} doses',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
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
