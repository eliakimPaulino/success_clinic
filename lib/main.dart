import 'package:clinica_exito/core/theme/app_theme.dart';
import 'package:clinica_exito/core/theme/theme_provider.dart';
import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MedicationAdapter());
  await Hive.openBox<Medication>('remedios');
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: ClinicaExitoApp(),
    ),
  );
}

class ClinicaExitoApp extends StatelessWidget {
  const ClinicaExitoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Clínica Êxito',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
