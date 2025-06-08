import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  final Medication medication;

  const MedicationCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.asset(
            'assets/tirzepatide.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 160,
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 8),
                Text(
                  'Como tomar a tirzepatida',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
                  
            const Text(
              '📅 Frequência:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Uma vez por semana, no mesmo dia, com ou sem alimentos.'),
                  
            const SizedBox(height: 8),
            const Text(
              '💉 Aplicação:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Via subcutânea – abdômen, coxa ou braço.'),
                  
            const SizedBox(height: 8),
            const Text(
              '📈 Esquema de doses:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('• Semanas 1-4: 2,5 mg/semana (ajuste inicial)\n'
                '• Semanas 5-8: 5 mg/semana\n'
                '• Semanas 9-12: 7,5 mg/semana\n'
                '• Semana 13+: 10 mg ou mais, conforme orientação médica'),
                  
            const SizedBox(height: 8),
            const Text(
              '⏰ Esqueceu uma dose?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Aplique dentro de 4 dias. Depois disso, pule e volte à rotina.'),
                  
            const SizedBox(height: 8),
            const Text(
              '⚠️ Cuidados:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('• Não reutilize a caneta.\n'
                '• Não injete em veias ou músculos.\n'
                '• Armazene refrigerado. Pode ficar até 14 dias fora da geladeira (até 30°C).'),
            const Text(
                      'Dúvidas sobre aplicação? ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
        
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// margin: EdgeInsets.all(8),
      // child: ListTile(
      //   leading: Icon(Icons.medical_services),
      //   title: Text(medication.nome),
      //   subtitle: Text('Início: ${medication.data} | ${medication.dosagem} por semana'),
      // ),