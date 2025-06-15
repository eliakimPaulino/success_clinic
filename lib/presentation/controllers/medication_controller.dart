import 'package:success_clinic/models/medicamento.dart';

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
