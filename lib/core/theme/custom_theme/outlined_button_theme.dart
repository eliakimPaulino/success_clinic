import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../constants/success_clinic_colors.dart';

/* -- Temas de Outlined Button para Claro & Escuro -- */
class KOutlinedButtonTheme {
  KOutlinedButtonTheme._(); // Para evitar criação de instâncias

  /* -- Tema Claro -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KSuccessClinicColors.dark, // Cor do texto/borda do botão no tema claro
      side: const BorderSide(color: KSuccessClinicColors.borderPrimary), // Cor da borda
      textStyle: const TextStyle(fontSize: 16, color: KSuccessClinicColors.black, fontWeight: FontWeight.w600), // Estilo do texto
      padding: const EdgeInsets.symmetric(vertical: KSizes.buttonHeight, horizontal: 20), // Espaçamento interno
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.buttonRadius)), // Formato do botão
    ),
  );

  /* -- Tema Escuro -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: KSuccessClinicColors.light, // Cor do texto/borda do botão no tema escuro
      side: const BorderSide(color: KSuccessClinicColors.borderPrimary), // Cor da borda
      textStyle: const TextStyle(fontSize: 16, color: KSuccessClinicColors.textWhite, fontWeight: FontWeight.w600), // Estilo do texto
      padding: const EdgeInsets.symmetric(vertical: KSizes.buttonHeight, horizontal: 20), // Espaçamento interno
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(KSizes.buttonRadius)), // Formato do botão
    ),
  );
}
