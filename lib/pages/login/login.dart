import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rocio_app/components/text_field/primary_text_field.dart';
import 'package:rocio_app/components/button/primary_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // on login button pressed
  void _login(BuildContext context) {
    if (kDebugMode) {
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  void _register(BuildContext context) {
    if (kDebugMode) {
      print('Register');
    }
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150.0,
                    height: 150.0,
                  ),
                  const SizedBox(height: 25.0),
                  const Text(
                    'Inicia Sesión',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    '¡Hola! Me alegra verte de nuevo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 25.0),
                      child: Column(
                        children: [
                          PrimaryTextField(
                              controller: _usernameController,
                              labelText: 'Usuario',
                              hintText: 'Usuario'),
                          const SizedBox(height: 16.0),
                          PrimaryTextField(
                              controller: _passwordController,
                              labelText: 'Contraseña',
                              hintText: 'Contraseña'),
                          const SizedBox(height: 16.0),
                          PrimaryButton(
                            action: _login,
                            label: 'Iniciar Sesión',
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '¿Aún no tienes una cuenta?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _register(context);
                                },
                                child: const Text(
                                  'Regístrate',
                                  style: TextStyle(
                                    color: Color(0xFF595959),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}