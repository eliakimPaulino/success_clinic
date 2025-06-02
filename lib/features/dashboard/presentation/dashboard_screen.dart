// ignore_for_file: use_build_context_synchronously

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
  // final repo = RemedioRepository();
  late Box<Medication> _medicationBox;

  @override
  void initState() {
    super.initState();
    _medicationBox = Hive.box<Medication>('remedios');
  }

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box<Medication>('remedios');
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
        title: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/dr_willian_rangel.png'),
            ),
            Text("Seja Bem-vindo(a)!"),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _medicationBox.listenable(),
        builder: (context, Box<Medication> box, __) {
          final remedios = box.values.toList();
          final mediaQuery = MediaQuery.of(context);
          final alturaCabecalho = mediaQuery.size.height * 0.20;

          return Column(
            children: [
              // 📌 Cabeçalho no topo ocupando 30% da altura
              Container(
                height: alturaCabecalho,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
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
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=3', // Substitua pela imagem real
                      ),
                    ),
                    SizedBox(width: 16),
                    // Informações
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'João da Silva',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Idade: 35  •  Sexo: Masculino'),
                          SizedBox(height: 4),
                          Text(
                            'Clínica Êxito',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(
                            'Saúde e Bem-estar',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                                  child: Card(
                                    margin: EdgeInsets.all(8),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.blue.shade100,
                                        child: Text(
                                          med.nome[0].toUpperCase(),
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () => delete(med),
                                        color: Colors.blue,
                                        icon: Icon(Icons.delete),
                                      ),
                                      title: Text(med.nome),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Dosagem: ${med.dosagem}"),
                                          Text(
                                            "Data: ${med.data.day}/${med.data.month}/${med.data.year}",
                                          ),
                                          Text("Intervalo: ${med.intervalo}"),
                                        ],
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
