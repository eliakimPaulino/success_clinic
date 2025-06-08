import 'package:hive/hive.dart';

part 'adapters/medico.g.dart';

@HiveType(typeId: 0)
class Medico {
  @HiveField(0)
  final String nome;

  @HiveField(1)
  final String especialidade;

  @HiveField(2)
  final String photo;

  Medico({
    required this.nome,
    required this.especialidade,
    required this.photo,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      nome: json['nome'],
      especialidade: json['especialidade'],
      photo: json['photo'] ?? '', // Default to empty string if photo is not provided
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'especialidade': especialidade,
      'photo': photo,
    };
  }
}
