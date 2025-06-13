import 'package:clinica_exito/core/injector.dart';
import 'package:clinica_exito/core/theme/app_theme.dart';
import 'package:clinica_exito/core/theme/theme_provider.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:clinica_exito/models/medico.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inicializa o diretório do Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // 2. Registra todos os adapters ANTES de abrir caixas ou injetar dependências
  Hive.registerAdapter(MedicoAdapter());
  Hive.registerAdapter(MedicamentoAdapter());

  // Abra as boxes necessárias aqui
  await Hive.openBox<Medico>('medicos');
  await Hive.openBox<Medicamento>('medicamentos');

  // 3. Injeta dependências (setupInjector pode abrir caixas usando Hive)
  await setupInjector();

  // 4. Inicia o app
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ClinicaExitoApp(),
    ),
  );
}

class ClinicaExitoApp extends StatelessWidget {
  const ClinicaExitoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Success Clinic',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
