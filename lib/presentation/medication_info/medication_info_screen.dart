import 'package:success_clinic/presentation/dashboard/widgets/helper_widgets.dart';
import 'package:success_clinic/presentation/medication_info/widgets/info_section.dart';
import 'package:success_clinic/presentation/medication_info/widgets/medication_header.dart';
import 'package:flutter/material.dart';
import 'package:success_clinic/models/medication_info_model.dart';
import 'package:success_clinic/models/video_info.dart';

class MedicationInfoScreen extends StatefulWidget {
  final MedicationInfo info;

  const MedicationInfoScreen({super.key, required this.info});

  @override
  State<MedicationInfoScreen> createState() => _MedicationInfoScreenState();
}

class _MedicationInfoScreenState extends State<MedicationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<VideoInfo>(
        future: fetchVideoInfo(
          'https://www.youtube.com/watch?v=FboRLOqOlIg&list=LL&index=7',
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar vídeo'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Nenhum vídeo encontrado'));
          }

          final videoInfo = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MedicationHeader(imagePath: widget.info.imagePath, title: widget.info.title),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoPreviewTile(info: videoInfo),
                      const SizedBox(height: 16),
                      InfoSection(title: 'Frequência', content: widget.info.frequency),
                      InfoSection(title: 'Aplicação', content: widget.info.application),
                      InfoSection(
                        title: 'Esquema de dosagem',
                        content: widget.info.dosageScheme,
                      ),
                      InfoSection(title: 'Dose esquecida', content: widget.info.missedDose),
                      InfoSection(title: 'Precauções', content: widget.info.precautions),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          widget.info.helpText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
