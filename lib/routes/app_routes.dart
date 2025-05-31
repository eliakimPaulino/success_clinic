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
  };
}
