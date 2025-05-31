// medication_data.dart

class MedicationInfo {
  final String imagePath;
  final String title;
  final String frequency;
  final String application;
  final String dosageScheme;
  final String missedDose;
  final String precautions;
  final String helpText;

  MedicationInfo({
    required this.imagePath,
    required this.title,
    required this.frequency,
    required this.application,
    required this.dosageScheme,
    required this.missedDose,
    required this.precautions,
    required this.helpText,
  });
}

// Lista de medicações
final List<MedicationInfo> medications = [
  MedicationInfo(
    imagePath: 'assets/tirzepatide.png',
    title: 'Como tomar a tirzepatida',
    frequency: 'Uma vez por semana, no mesmo dia, com ou sem alimentos.',
    application: 'Via subcutânea – abdômen, coxa ou braço.',
    dosageScheme:
        '• Semanas 1-4: 2,5 mg/semana (ajuste inicial)\n'
        '• Semanas 5-8: 5 mg/semana\n'
        '• Semanas 9-12: 7,5 mg/semana\n'
        '• Semana 13+: 10 mg ou mais, conforme orientação médica',
    missedDose: 'Aplique dentro de 4 dias. Depois disso, pule e volte à rotina.',
    precautions:
        '• Não reutilize a caneta.\n'
        '• Não injete em veias ou músculos.\n'
        '• Armazene refrigerado. Pode ficar até 14 dias fora da geladeira (até 30°C).',
    helpText: 'Dúvidas sobre aplicação?',
  ),

  MedicationInfo(
    imagePath: 'assets/metformina.png',
    title: 'Como tomar a metformina',
    frequency: '1-3 vezes por dia com as refeições, conforme prescrição médica.',
    application: 'Via oral, com água, preferencialmente durante as refeições.',
    dosageScheme:
        '• Inicial: 500 mg 1x ao dia\n'
        '• Pode ser ajustada gradualmente até 2000 mg/dia, conforme tolerância.',
    missedDose: 'Tome assim que lembrar. Se estiver perto da próxima dose, pule a anterior.',
    precautions:
        '• Pode causar desconforto gastrointestinal no início.\n'
        '• Nunca tome dose dobrada.\n'
        '• Armazene em local seco, ao abrigo da luz.',
    helpText: 'Em caso de efeitos adversos, procure o médico.',
  ),

  MedicationInfo(
  imagePath: 'assets/semaglutide.png',
  title: 'Como tomar a semaglutida',
  frequency: 'Uma vez por semana, no mesmo dia, com ou sem alimentos.',
  application: 'Via subcutânea – abdômen, coxa ou braço.',
  dosageScheme:
      '• Semanas 1-4: 0,25 mg/semana (ajuste inicial)\n'
      '• Semanas 5-8: 0,5 mg/semana\n'
      '• Semanas 9-12: 1 mg/semana\n'
      '• Semana 13+: 1,7 mg ou mais, conforme orientação médica',
  missedDose: 'Aplique dentro de 4 dias. Depois disso, pule e volte à rotina.',
  precautions:
      '• Não reutilize a caneta.\n'
      '• Não injete em veias ou músculos.\n'
      '• Armazene refrigerado. Pode ficar até 28 dias fora da geladeira (até 30°C).',
  helpText: 'Dúvidas sobre aplicação?',
),
];