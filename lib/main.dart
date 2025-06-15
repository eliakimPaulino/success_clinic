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
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter está pronto antes de executar código assíncrono

  try {
    final appDocumentDir = await getApplicationDocumentsDirectory(); // Obtém o diretório de documentos do app
    Hive.init(appDocumentDir.path); // Inicializa o Hive com o caminho do diretório

    Hive.registerAdapter(MedicoAdapter()); // Registra o adapter do modelo Medico para Hive
    Hive.registerAdapter(MedicamentoAdapter()); // Registra o adapter do modelo Medicamento para Hive

    await Hive.openBox<Medico>('medicos'); // Abre a box (tabela) de médicos
    await Hive.openBox<Medicamento>('medicamentos'); // Abre a box (tabela) de medicamentos
  } catch (e, s) {
    print('Erro no setup do Hive: $e\n$s'); // Captura e exibe erros na configuração do Hive
  }

  try {
    await setupInjector(); // Configura a injeção de dependências (getIt)
  } catch (e, s) {
    print('Erro no setupInjector: $e\n$s'); // Captura e exibe erros na configuração do injector
  }

  try {
    final authController = getIt<AuthController>(); // Recupera o AuthController usando o getIt
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()), // Provider para alternância de tema (claro/escuro)
          Provider<AuthController>.value(value: authController), // Provider para autenticação
        ],
        child: const ClinicaExitoApp(), // Widget raiz do app
      ),
    );
  } catch (e, s) {
    print('Erro antes do runApp: $e\n$s'); // Captura e exibe erros antes de rodar o app
  }
}

class ClinicaExitoApp extends StatelessWidget {
  const ClinicaExitoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Success Clinic', // Título do app
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      themeMode: ThemeMode.system, // Usa o tema do sistema (claro/escuro)
      theme: AppTheme.lightTheme, // Tema claro
      darkTheme: AppTheme.darkTheme, // Tema escuro
      onGenerateRoute: AppRoutes.onGenerateRoute, // Gerenciamento de rotas nomeadas
      initialRoute: '/', // Rota inicial do app
    );
  }
}
