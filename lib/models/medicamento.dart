import 'package:hive/hive.dart';

part 'adapters/medicamento.g.dart';

@HiveType(typeId: 1)
class Medicamento {
  @HiveField(0)
  final String nome;

  @HiveField(1)
  final String dosagem;

  Medicamento({
    required this.nome,
    required this.dosagem,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      nome: json['nome'],
      dosagem: json['dosagem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dosagem': dosagem,
    };
  }
}
