// ignore_for_file: use_build_context_synchronously, unused_element

import 'package:clinica_exito/features/dashboard/presentation/widgets/medication_tile.dart';
import 'package:clinica_exito/features/medication/data/medication_info_model.dart';
import 'package:clinica_exito/features/medication/data/medication_model.dart';
import 'package:clinica_exito/features/medication/data/medications_details_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Box<Medication> _medicationBox;

  @override
  void initState() {
    super.initState();
    _medicationBox = Hive.box<Medication>('remedios');
  }

  @override
  Widget build(BuildContext context) {
    // Função para deletar uma medicação
    // Utiliza a chave do objeto para deletar corretamente
    void delete(Medication medication) async {
      var box = Hive.box<Medication>('remedios');

      // Encontrar a chave do objeto
      final keyToDelete = box.keys.firstWhere(
        (key) => box.get(key) == medication,
        orElse: () => null,
      );

      if (keyToDelete != null) {
        await box.delete(keyToDelete);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Medicação removida com sucesso")),
        );
        setState(() {}); // Atualiza a UI, se necessário
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erro ao remover a medicação.")));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Seja Bem-vindo(a)!",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _medicationBox.listenable(),
        builder: (context, Box<Medication> box, __) {
          final remedios = box.values.toList();
          final mediaQuery = MediaQuery.of(context);
          final alturaCabecalho = mediaQuery.size.height * 0.20;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📌 Cabeçalho no topo ocupando 30% da altura
              Container(
                height: alturaCabecalho,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1C3B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Foto circular
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=3',
                      ),
                    ),
                    SizedBox(width: 16),
                    // Informações do paciente
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'João da Silva',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('35  •  Masculino'),
                          SizedBox(height: 4),
                          Text(
                            'Clínica Êxito',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            'Saúde e Bem-estar',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Text(
                  'Medicações',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // 📋 Lista de medicamentos
              Expanded(
                child: remedios.isEmpty
                    ? Center(child: Text('Nenhum remédio cadastrado.'))
                    : ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: box.length,
                        itemBuilder: (_, index) {
                          final med = box.getAt(index);
                          return med == null
                              ? SizedBox.shrink() // Evita erro se o item for nulo
                              : GestureDetector(
                                  onDoubleTap: () {
                                    final medInfoMap = medicationDetailsList
                                        .firstWhere(
                                          (element) => element['title']!
                                              .toLowerCase()
                                              .contains(med.nome.toLowerCase()),
                                          orElse: () => {},
                                        );

                                    if (medInfoMap.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Detalhes da medicação não encontrados',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                    final medInfo = MedicationInfo.fromJson(
                                      medInfoMap,
                                    );

                                    Navigator.pushNamed(
                                      context,
                                      '/medication-info',
                                      arguments: medInfo,
                                    );
                                  },
                                  child: MedicationTile(
                                    medication: med,
                                    image: MedicationInfo.fromJson(
                                      medicationDetailsList.firstWhere(
                                        (element) => element['title']!
                                            .toLowerCase()
                                            .contains(med.nome.toLowerCase()),
                                        orElse: () => {},
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-medication'),
        tooltip: "Cadastrar Medicação",
        child: Icon(Icons.add),
      ),
    );
  }
}
