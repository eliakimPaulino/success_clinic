import 'package:hive/hive.dart';

part 'medication_model.g.dart';

@HiveType(typeId: 0)
class Medication {
  @HiveField(0)
  String nome;

  @HiveField(1)
  String dosagem;

  @HiveField(2)
  DateTime data;

  @HiveField(3)
  String intervalo;

  Medication({
    required this.nome,
    required this.dosagem,
    required this.data,
    required this.intervalo,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      nome: json['nome'] as String,
      dosagem: json['dosagem'] as String,
      data: json['data'] as DateTime,
      intervalo: json['intervalo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dosagem': dosagem,
      'data': data,
      'intervalo': intervalo,
    };
  }
}