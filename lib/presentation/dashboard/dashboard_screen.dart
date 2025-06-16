// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/medicamento.dart';
import '../../core/constants/success_clinic_colors.dart';
import '../controllers/auth_controller.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/medication_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Box<Medicamento> _medicationBox;
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    _medicationBox = Hive.box<Medicamento>('medicamentos');
  }

  void _logout(BuildContext context) async {
    print('Logout iniciado');
    final authController = Provider.of<AuthController>(context, listen: false);
    await authController.logout();
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    print('Logout concluído');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authController = Provider.of<AuthController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: "Abrir menu",
          ),
        ),
        title: FutureBuilder<String?>(
          future: _authController.getNameUseCase(),
          builder: (context, snap) {
            final name = snap.data;
            final title = (name == null) ? 'Bem-vindo!' : 'Bem-vindo $name!';
            return Text(title, style: Theme.of(context).appBarTheme.titleTextStyle);
          },
        ),
        actions: [IconButton(icon: Icon(Icons.person_2), onPressed: () {})],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).appBarTheme.backgroundColor ??
                    (isDark
                        ? KSuccessClinicColors.primary
                        : KSuccessClinicColors.accent),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital),
              title: const Text('Médicos'),
              onTap: () => Navigator.pushNamed(context, '/doctors'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _medicationBox.listenable(),
        builder: (context, Box<Medicamento> box, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(mediaQuery: mediaQuery),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Text(
                  'Medicações',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: MedicationList(remedios: box.values.toList())),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-medication'),
        tooltip: "Cadastrar Medicação",
        child: const Icon(Icons.add),
      ),
    );
  }
}
