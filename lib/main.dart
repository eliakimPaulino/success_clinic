// ignore_for_file: avoid_print

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
import 'presentation/controllers/auth_controller.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // 1. Inicializa o diretório do Hive
//   final appDocumentDir = await getApplicationDocumentsDirectory();
//   Hive.init(appDocumentDir.path);

//   // 2. Registra todos os adapters ANTES de abrir caixas ou injetar dependências
//   Hive.registerAdapter(MedicoAdapter());
//   Hive.registerAdapter(MedicamentoAdapter());

//   // Abra as boxes necessárias aqui
//   await Hive.openBox<Medico>('medicos');
//   await Hive.openBox<Medicamento>('medicamentos');

//   // 3. Injeta dependências (setupInjector pode abrir caixas usando Hive)
//   await setupInjector();

//   // 4. Inicia o app
//     final authController = getIt<AuthController>();
//   runApp(

//     MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => ThemeProvider()),
//       Provider<AuthController>.value(value: authController),
//     ],
//     child: const ClinicaExitoApp(),
//   ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('>> main: iniciado');

  try {
    print('>> Hive init');
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    print('>> Hive register adapters');
    Hive.registerAdapter(MedicoAdapter());
    Hive.registerAdapter(MedicamentoAdapter());

    print('>> Hive open boxes');
    await Hive.openBox<Medico>('medicos');
    await Hive.openBox<Medicamento>('medicamentos');
  } catch (e, s) {
    print('Erro no setup do Hive: $e\n$s');
  }

  try {
    print('>> setupInjector');
    await setupInjector();
  } catch (e, s) {
    print('Erro no setupInjector: $e\n$s');
  }

  try {
    print('>> recupera AuthController');
    final authController = getIt<AuthController>();
    print('>> authController ok: $authController');
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          Provider<AuthController>.value(value: authController),
        ],
        child: const ClinicaExitoApp(),
      ),
    );
    print('>> runApp chamado');
  } catch (e, s) {
    print('Erro antes do runApp: $e\n$s');
  }
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
