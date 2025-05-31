import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Login"))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Usuário')),
              TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Senha')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'),
                child: Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
