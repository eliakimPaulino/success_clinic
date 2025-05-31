import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:hive/hive.dart';

class RemedioRepository {
  final Box<Medication> box = Hive.box<Medication>('remedios');

  List<Medication> getAll() => box.values.toList();

  Future<void> add(Medication remedio) async {
    await box.add(remedio);
  }

  Future<void> delete(int index) async {
    await box.deleteAt(index);
  }
}
