import 'package:hive/hive.dart';

part 'doctor_model.g.dart';

@HiveType(typeId: 1)
class Doctors extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String specialty;

  @HiveField(2)
  int crm;

  Doctors({required this.name, required this.specialty, required this.crm});
  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      crm: json['crm'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'crm': crm,
    };
  }
}
