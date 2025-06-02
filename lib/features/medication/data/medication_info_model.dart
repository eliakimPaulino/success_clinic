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

  factory MedicationInfo.fromJson(Map<String, dynamic> json) {
    return MedicationInfo(
      imagePath: json['imagePath'] ?? '',
      title: json['title'] ?? '',
      frequency: json['frequency'] ?? '',
      application: json['application'] ?? '',
      dosageScheme: json['dosageScheme'] ?? '',
      missedDose: json['missedDose'] ?? '',
      precautions: json['precautions'] ?? '',
      helpText: json['helpText'] ?? '',
    );
  }
}
