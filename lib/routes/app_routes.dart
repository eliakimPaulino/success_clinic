import 'package:clinica_exito/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:clinica_exito/screens/doctors/presentation/doctors_screen.dart';
import 'package:clinica_exito/features/medication/data/medication_info_model.dart';
import 'package:clinica_exito/screens/medication_info/presentation/medication_info_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../screens/medication_form/medication_form_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case '/add-medication':
        return MaterialPageRoute(builder: (_) => MedicationFormScreen());
      case '/doctors':
        return MaterialPageRoute(builder: (_) => DoctorsScreen());
      case '/medication-info':
        final args = settings.arguments;
        if (args is MedicationInfo) {
          return MaterialPageRoute(
            builder: (_) => MedicationInfoScreen(info: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erro')),
        body: const Center(child: Text('Rota não encontrada')),
      ),
    );
  }
}
