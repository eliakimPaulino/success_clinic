import 'package:success_clinic/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardHeader extends StatelessWidget {
  final MediaQueryData mediaQuery;

  const DashboardHeader({super.key, required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final alturaCabecalho = mediaQuery.size.height * 0.20;

    return Container(
      height: alturaCabecalho,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? null : Colors.indigo,
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
                  'João da Silva',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('35  •  Masculino', style: TextStyle(color: Colors.white)),
                SizedBox(height: 4),
                Text(
                  'Clínica Êxito',
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
