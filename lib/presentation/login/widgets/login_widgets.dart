import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class KLoginHeader extends StatelessWidget {
  const KLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24.0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: KSizes.imageCarouselHeight,
          width: KSizes.imageCarouselHeight,
          decoration: BoxDecoration(
            color: dark ? Colors.white : Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        // -- TITULO E SUBTITULO
        Text(
          KTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          KTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class KLoginForm extends StatelessWidget {
  const KLoginForm({
    super.key,
    required TextEditingController userEmailController,
    required TextEditingController passwordController,
  }) : _userEmailController = userEmailController,
       _passwordController = passwordController;

  final TextEditingController _userEmailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          // -- INPUT PARA NOME
          TextFormField(
            controller: _userEmailController,
            decoration: const InputDecoration(
              labelText: KTexts.email,
              prefixIcon: Icon(Icons.email),
              suffixIcon: Icon(Icons.check_circle),
            ),
          ),

          // -- INPUT PARA SENHA
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: KTexts.password,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
        ],
      ),
    );
  }
}
