// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../constants/success_clinic_colors.dart';

class KChipTheme {
  KChipTheme._(); // Construtor privado para evitar instanciação

  // Tema claro para Chip
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: KSuccessClinicColors.grey.withOpacity(0.4), // Cor quando desabilitado
    labelStyle: const TextStyle(color: KSuccessClinicColors.black), // Estilo do texto do chip
    selectedColor: KSuccessClinicColors.primary, // Cor quando selecionado
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Espaçamento interno
    checkmarkColor: KSuccessClinicColors.white, // Cor do ícone de seleção
  );

  // Tema escuro para Chip
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: KSuccessClinicColors.darkerGrey, // Cor quando desabilitado
    labelStyle: TextStyle(color: KSuccessClinicColors.white), // Estilo do texto do chip
    selectedColor: KSuccessClinicColors.primary, // Cor quando selecionado
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Espaçamento interno
    checkmarkColor: KSuccessClinicColors.white, // Cor do ícone de seleção
  );
}
