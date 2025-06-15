import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../constants/success_clinic_colors.dart';

class KTextFormFieldTheme {
  KTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3, // Número máximo de linhas para mensagens de erro
    prefixIconColor: KSuccessClinicColors.darkGrey, // Cor do ícone prefixo
    suffixIconColor: KSuccessClinicColors.darkGrey, // Cor do ícone sufixo
    // constraints: const BoxConstraints.expand(height: KSizes.inputFieldHeight), // Restrições de altura do campo (comentado)
    labelStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeMd, color: KSuccessClinicColors.black), // Estilo do rótulo
    hintStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KSuccessClinicColors.black), // Estilo da dica
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal), // Estilo da mensagem de erro
    floatingLabelStyle: const TextStyle().copyWith(color: KSuccessClinicColors.black.withOpacity(0.8)), // Estilo do rótulo flutuante
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.grey),
    ), // Borda padrão
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.grey),
    ), // Borda quando habilitado
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.dark),
    ), // Borda quando focado
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.warning),
    ), // Borda em caso de erro
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: KSuccessClinicColors.warning),
    ), // Borda em caso de erro e focado
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2, // Número máximo de linhas para mensagens de erro
    prefixIconColor: KSuccessClinicColors.darkGrey, // Cor do ícone prefixo
    suffixIconColor: KSuccessClinicColors.darkGrey, // Cor do ícone sufixo
    // constraints: const BoxConstraints.expand(height: KSizes.inputFieldHeight), // Restrições de altura do campo (comentado)
    labelStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeMd, color: KSuccessClinicColors.white), // Estilo do rótulo
    hintStyle: const TextStyle().copyWith(fontSize: KSizes.fontSizeSm, color: KSuccessClinicColors.white), // Estilo da dica
    floatingLabelStyle: const TextStyle().copyWith(color: KSuccessClinicColors.white.withOpacity(0.8)), // Estilo do rótulo flutuante
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.darkGrey),
    ), // Borda padrão
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.darkGrey),
    ), // Borda quando habilitado
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.white),
    ), // Borda quando focado
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: KSuccessClinicColors.warning),
    ), // Borda em caso de erro
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(KSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: KSuccessClinicColors.warning),
    ), // Borda em caso de erro e focado
  );
}
