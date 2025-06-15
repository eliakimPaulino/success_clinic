import 'package:success_clinic/core/di/injection.dart';
import 'package:success_clinic/presentation/dashboard/dashboard_screen.dart';
import 'package:success_clinic/presentation/doctors/doctors_screen.dart';
import 'package:success_clinic/models/medication_info_model.dart';
import 'package:success_clinic/presentation/medication_info/medication_info_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/login/login_screen.dart';
import '../../presentation/register/register_screen.dart';
import '../../presentation/medication_form/medication_form_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(authController: injectAuthController()),
        );
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen(authController: injectAuthController(),));
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
