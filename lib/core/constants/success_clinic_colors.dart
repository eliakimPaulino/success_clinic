// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class KSuccessClinicColors {
  // ✅ Cores principais do tema do app (inspiradas no site)
  static const Color primary = Color(0xFFCC9E42);        // Dourado mostarda (highlights)
  static const Color secondary = Color(0xFF333333);      // Cinza escuro para segundo plano
  static const Color accent = Color(0xFF8C7132);         // Tom intermediário de acento

  // 📝 Cores para textos
  static const Color textPrimary = Color(0xFF333333);    // Texto principal escuro
  static const Color textSecondary = Color(0xFF6C757D);  // Cinza médio (suporte)
  static const Color textWhite = Colors.white;           // Texto claro

  // 🎨 Cores de fundo
  static const Color light = Color(0xFFF6F6F6);          // Fundo geral suave
  static const Color dark = Color(0xFF272727);           // Fundo escuro para temas invertidos
  static const Color primaryBackground = Color(0xFFFFFFFF); // Branco neutro predominante

  // 📦 Containers de fundo
  static const Color lightContainer = Color(0xFFF9F9F9); // Fundo leve para cards e seções
  static final Color darkContainer = Colors.white.withOpacity(0.1);

  // 🛎️ Cores de botões
  static const Color buttonPrimary = Color(0xFFCC9E42);      // Botão principal (destaque)
  static const Color buttonSecondary = Color(0xFF6C757D);    // Botão secundário neutro
  static const Color buttonDisabled = Color(0xFFC4C4C4);     // Botão desativado claro

  // 🔲 Cores de borda
  static const Color borderPrimary = Color(0xFFE6E6E6);      // Borda suave
  static const Color borderSecondary = Color(0xFFD9D9D9);    // Borda sutil

  // ⚠️ Estados: erro, sucesso, aviso e informações
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // 🖤 Tons neutros
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
