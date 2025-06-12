import 'package:clinica_exito/models/medicamento.dart';

class MedicationFormController {
  String? name;
  String? dose;
  String interval = '7 dias';
  DateTime? startDate;

  Medicamento toMedicamento() {
    return Medicamento(
      nome: name!,
      dosagem: dose!,
      intervalo: interval,
      data: startDate!,
    );
  }
}
