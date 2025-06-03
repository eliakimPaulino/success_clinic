import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'routes/app_routes.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MedicationAdapter());
  await Hive.openBox<Medication>('remedios');
  runApp(ClinicaExitoApp());
}

class ClinicaExitoApp extends StatelessWidget {
  const ClinicaExitoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clínica Êxito',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1025),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Sans'),
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
