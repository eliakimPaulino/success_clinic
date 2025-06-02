import 'package:clinica_exito/features/medication/data/medication_info_model.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/medication/presentation/medication_form_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/dashboard': (context) => DashboardScreen(),
    '/add-medication': (context) => MedicationFormScreen(),
    // '/medication-info': () => MedicationInfo(imagePath: imagePath, title: title, frequency: frequency, application: application, dosageScheme: dosageScheme, missedDose: missedDose, precautions: precautions, helpText: helpText) 
  };
}
