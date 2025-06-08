import 'package:clinica_exito/features/medication/data/medication_info_model.dart';
import 'package:clinica_exito/features/medication/data/video_info.dart';
import 'package:clinica_exito/features/medication/presentation/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';

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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar vídeo'));
          } else if (snapshot.hasData) {
            final videoInfo = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage(widget.info.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Gradiente para escurecer o topo
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(153, 0, 0, 0),
                              Colors.transparent, // transparente no fim
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              widget.info.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        VideoPreviewTile(info: videoInfo),
                        const SizedBox(height: 10),
                        InfoSection(
                          title: 'Frequência',
                          content: widget.info.frequency,
                        ),
                        InfoSection(
                          title: 'Aplicação',
                          content: widget.info.application,
                        ),
                        InfoSection(
                          title: 'Esquema de dosagem',
                          content: widget.info.dosageScheme,
                        ),
                        InfoSection(
                          title: 'Dose esquecida',
                          content: widget.info.missedDose,
                        ),
                        InfoSection(
                          title: 'Precauções',
                          content: widget.info.precautions,
                        ),
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
                  const SizedBox(height: 16),
                ],
              ),
            );
          } else {
            return Center(child: Text('Nenhum vídeo encontrado'));
          }
        },
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String content;

  const InfoSection({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
