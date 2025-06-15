// ignore_for_file: avoid_print

import 'package:success_clinic/core/injector.dart';
import 'package:success_clinic/core/theme/app_theme.dart';
import 'package:success_clinic/core/theme/theme_provider.dart';
import 'package:success_clinic/models/medicamento.dart';
import 'package:success_clinic/models/medico.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_routes.dart';
import 'presentation/controllers/auth_controller.dart';

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
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Success Clinic',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
