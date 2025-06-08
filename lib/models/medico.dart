import 'package:hive/hive.dart';

part 'adapters/medico.g.dart';

@HiveType(typeId: 0)
class Medico {
  @HiveField(0)
  final String nome;

  @HiveField(1)
  final String especialidade;

  Medico({
    required this.nome,
    required this.especialidade,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      nome: json['nome'],
      especialidade: json['especialidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'especialidade': especialidade,
    };
  }
}
