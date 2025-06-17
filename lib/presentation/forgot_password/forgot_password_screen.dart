import 'package:flutter/material.dart';
import 'package:success_clinic/core/constants/sizes.dart';
import 'package:success_clinic/core/constants/text_strings.dart';

import '../../core/utils/validators/validation.dart';

class KForgotPasswordScreen extends StatelessWidget {
  const KForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(KSizes.defaultSpace),
        child: Column(
          spacing: KSizes.spaceBtwSections,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            Text(
              KTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Subtítulo explicativo
            Text(
              KTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),

            // Campo de entrada para o e-mail
            TextFormField(
              validator: (value) => KValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: KTexts.email,
                prefixIcon: Icon(Icons.email_outlined),
                suffixIcon: Icon(Icons.check_circle)
              ),
            ),

            // Botão para enviar o e-mail de recuperação
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Enviar e-mail de recuperação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
