import 'package:clinica_exito/models/medication_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static Future<void> start() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(MedicationAdapter());

    await Hive.openBox<Medication>('remedios');
  }
}
