//ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:success_clinic/presentation/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  /*----------- FIM PROCESSO DE LOGIN -----------*/

  /*----- LIBERA RECURSOS DOS CONTROLADORES -----*/
  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  /*------ FIM LIBERA RECURSO CONTROLADORES ------*/

  /*------- CONSTRUCAO INTERFACE DE LOGIN -------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Login"))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*--------- INPUT PARA NOME DE USUARIO ---------*/
              TextField(
                controller: _userEmailController,
                decoration: const InputDecoration(labelText: 'Usuário'),
              ),

              /*-------- INPUT PARA SENHA DE USUARIO --------*/
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),

              const SizedBox(height: 20),

              /*--------- BOTAO DE LOGIN E CADASTRO ---------*/
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text("Entrar"),
                    ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text("Não tem uma conta? Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
