import 'package:hive/hive.dart';

part 'adapters/medicamento.g.dart';

@HiveType(typeId: 1)
class Medicamento {
  @HiveField(0)
  final String nome;

  @HiveField(1)
  final String dosagem;

  @HiveField(2)
  final DateTime data;

  @HiveField(2)
  final String intervalo;

  Medicamento({
    required this.nome,
    required this.dosagem,
    required this.data,
    required this.intervalo,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      nome: json['nome'],
      dosagem: json['dosagem'],
      data: json['data'],
      intervalo: json['intervalo'],
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
