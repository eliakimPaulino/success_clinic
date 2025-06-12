import 'package:clinica_exito/core/shared/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:clinica_exito/models/medicamento.dart';
import 'package:clinica_exito/models/medication_info_model.dart';
import 'package:clinica_exito/models/medications_details_list.dart';
import 'package:clinica_exito/presentation/dashboard/widgets/medication_tile.dart';
import 'package:clinica_exito/presentation/controllers/medicamento_controller.dart';
import 'package:clinica_exito/core/injector.dart';
import 'package:hive/hive.dart';

class MedicationList extends StatefulWidget {
  final List<Medicamento> remedios;

  const MedicationList({super.key, required this.remedios});

  @override
  State<MedicationList> createState() => _MedicationListState();
}

class _MedicationListState extends State<MedicationList> {
  final _controller = getIt<MedicamentoController>();

  @override
  Widget build(BuildContext context) {
    if (widget.remedios.isEmpty) {
      return const Center(child: Text('Nenhum remédio cadastrado.'));
    }

    return FutureBuilder(
      future: _controller.carregarMedicamentos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: _controller.medicamentos.length,
          itemBuilder: (context, index) {
            final medicamento = _controller.medicamentos[index];
            final medInfoMap = medicationDetailsList.firstWhere(
              (element) => element['title']!
                  .toLowerCase()
                  .contains(medicamento.nome.toLowerCase()),
              orElse: () => {},
            );

            return GestureDetector(
              onLongPress: () => _deleteMedication(context, medicamento),
              onDoubleTap: () {
                if (medInfoMap.isEmpty) {
                  showCustomSnackBar(
                    context,
                    'Detalhes da medicação não encontrados',
                  );
                  return;
                }

                final medInfo = MedicationInfo.fromJson(medInfoMap);
                Navigator.pushNamed(
                  context,
                  '/medication-info',
                  arguments: medInfo,
                );
              },
              child: MedicationTile(
                medication: medicamento,
                image: MedicationInfo.fromJson(medInfoMap),
              ),
            );
          },
        );
      },
    );
  }

  void _deleteMedication(BuildContext context, Medicamento medicamento) async {
    final box = Hive.box<Medicamento>('medicamentos');
    final key = box.keys.firstWhere(
      (k) => box.get(k) == medicamento,
      orElse: () => null,
    );

    if (key != null) {
      await box.delete(key);
      showCustomSnackBar(context, 'Medicação removida com sucesso');
      setState(() {});
    } else {
      showCustomSnackBar(context, 'Erro ao remover a medicação.');
    }
  }
}
