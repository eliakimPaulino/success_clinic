import 'package:clinica_exito/features/medication/data/medication_info_model.dart';
import 'package:flutter/material.dart';

class MedicationInfoScreen extends StatelessWidget {
  final MedicationInfo info;

  const MedicationInfoScreen({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(info.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                info.imagePath,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            InfoSection(title: 'Frequência', content: info.frequency),
            InfoSection(title: 'Aplicação', content: info.application),
            InfoSection(title: 'Esquema de dosagem', content: info.dosageScheme),
            InfoSection(title: 'Dose esquecida', content: info.missedDose),
            InfoSection(title: 'Precauções', content: info.precautions),
            const SizedBox(height: 20),
            Center(
              child: Text(
                info.helpText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String content;

  const InfoSection({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
