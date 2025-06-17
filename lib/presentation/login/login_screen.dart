//ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:success_clinic/core/constants/text_strings.dart';
import 'package:success_clinic/core/style/spacing_styles.dart';
import 'package:success_clinic/presentation/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/login_widgets.dart';

class LoginScreen extends StatefulWidget {
  final AuthController authController;

  const LoginScreen({super.key, required this.authController});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /*---- CONTROLADORES PARA ENTRADA DE DADOS ----*/
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  /*-------- REALIZA O PROCESSO DE LOGIN --------*/
  void _login() async {
    setState(() => _isLoading = true);

    final email = _userEmailController.text.trim();

    final success = await widget.authController.login(
      _userEmailController.text.trim(),
      _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (success) {
      /*
          Hive: Armazena os usuários.
          SharedPreferences: Armazena apenas o email do usuário atualmente logado.
      */
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('loggedInEmail', email);

      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login falhou. Verifique suas credenciais.'),
        ),
      );
    }
  }

  /*----- LIBERA RECURSOS DOS CONTROLADORES -----*/
  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /*------- CONSTRUCAO INTERFACE DE LOGIN -------*/
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: KSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // -- IMAGEM DE LOGO E TITULO 
            KLoginHeader(),

            // -- FORMULARIO DE LOGIN
            KLoginForm(userEmailController: _userEmailController, passwordController: _passwordController),

            /*--------- BOTAO DE LOGIN E CADASTRO ---------*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: const Text("Entrar"),
                      ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/forget-password'),
                  child: const Text(KTexts.forgetPassword),
                ),
              ],
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text("Não tem uma conta? Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}


