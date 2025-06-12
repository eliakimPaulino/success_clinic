import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/medicamento.dart';
import '../../../core/theme/theme_provider.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/medication_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Box<Medicamento> _medicationBox;

  @override
  void initState() {
    super.initState();
    _medicationBox = Hive.box<Medicamento>('medicamentos');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.pushNamed(context, '/doctors'),
          tooltip: "Médicos",
        ),
        title: const Text(
          "Bem-vindo!",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.wb_sunny
                  : Icons.nightlight_round,
            ),
            onPressed: () =>
                themeProvider.toggleTheme(!themeProvider.isDarkMode),
          ),
        ],
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
