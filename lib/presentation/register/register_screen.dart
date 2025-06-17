// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:success_clinic/core/constants/sizes.dart';
import 'package:success_clinic/core/constants/text_strings.dart';
import 'package:success_clinic/core/utils/helpers/helper_functions.dart';
import 'package:success_clinic/core/utils/validators/validation.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/success_clinic_colors.dart';
import '../../domain/entities/user.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.authController});

  final AuthController authController;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _phoneController = TextEditingController();
  bool _acceptedTerms = false;

  void _submit() async {
    if (_formKey.currentState!.validate() && _acceptedTerms) {
      final user = User(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final success = await widget.authController.register(user);

      if (success) {
        /*
          Hive: Armazena todos os usuários.
          SharedPreferences: Armazena apenas o email do usuário atualmente logado.
      */
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('loggedInEmail', user.email);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cadastro realizado com sucesso!")),
        );
        print(
          'Registrando usuário: ${user.name}, email: ${user.email} senha: ${user.password}',
        );
        Navigator.pushReplacementNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao cadastrar. Tente novamente.")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Aceite os termos de uso para continuar")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: KSizes.defaultSpace,
            children: [
              Text(
                KTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
              Form(
                key: _formKey,
                child: Column(
                  spacing: KSizes.spaceBtwInputFields,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      expands: false,
                      decoration: InputDecoration(
                        labelText: KTexts.firstName,
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Campo obrigatório' : null,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: KTexts.email,
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) => KValidator.validateEmail(value),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: KTexts.phoneNo,
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) => KValidator.validatePhoneNumber(value),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: KTexts.password,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) => KValidator.validatePassword(value),
                    ),
                    SizedBox(height: 20),
                    CheckboxListTile(
                      value: _acceptedTerms,
                      onChanged: (value) =>
                          setState(() => _acceptedTerms = value!),
                      title: Text.rich(
                        TextSpan(
                          text: '${KTexts.iAgreeTo} ',
                          children: [
                            TextSpan(
                              text: '${KTexts.termsOfUse} ',
                              style: TextStyle(
                                color: dark ? KSuccessClinicColors.primary : KSuccessClinicColors.accent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: '${KTexts.and} '),
                            TextSpan(
                              text: KTexts.privacyPolicy,
                              style: TextStyle(
                                color: dark ? KSuccessClinicColors.primary : KSuccessClinicColors.accent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
