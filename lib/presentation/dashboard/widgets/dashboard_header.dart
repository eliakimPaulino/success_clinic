import 'package:flutter/material.dart';

import '../../../core/constants/success_clinic_colors.dart';

class DashboardHeader extends StatelessWidget {
  final MediaQueryData mediaQuery;

  const DashboardHeader({super.key, required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final alturaCabecalho = mediaQuery.size.height * 0.20;

    return Container(
      height: alturaCabecalho,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? KSuccessClinicColors.primary
            : KSuccessClinicColors.accent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=58'),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Eliakim França',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('32  •  M', style: TextStyle(color: Colors.white)),
                SizedBox(height: 4),
                Text(
                  'Clínica de Sucesso',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Saúde e Bem-estar',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
