import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../utils/validators.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores de texto para os campos de entrada
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Libera os controladores quando não forem mais necessários
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logotipo do aplicativo
                _buildLogo(),
                const SizedBox(height: 20),
                // Campo de entrada para o e-mail
                TextFieldWidget(
                  controller: emailController,
                  icon: Icons.email,
                  label: 'Email',
                  validator: emailValidator,
                ),
                const SizedBox(height: 10),
                // Campo de entrada para a senha
                TextFieldWidget(
                  controller: passwordController,
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 20),
                // Botão de login
                ButtonWidget(
                  onPressed: _onLoginPressed(controller),
                  child: const Text('Entrar'), // Texto alterado para "Entrar"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    // Método para construir o logotipo do aplicativo
    return Image.asset(
      'assets/img/logo.png', // Ajuste o caminho da imagem aqui
      width: 100,
    );
  }

  VoidCallback _onLoginPressed(AuthController controller) {
    // Método para definir a ação do botão de login
    return () async {
      try {
        await controller.login(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        _showErrorMessage(e);
      }
    };
  }

  void _showErrorMessage(dynamic error) {
    // Método para exibir mensagens de erro
    final errorMessage = error.toString().contains('specific error')
        ? "Email ou senha incorretos!"
        : "Erro ao tentar fazer login!";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }
}
