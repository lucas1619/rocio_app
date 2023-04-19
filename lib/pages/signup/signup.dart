import 'package:flutter/material.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/text_field/primary_text_field.dart';
import 'package:rocio_app/components/button/primary_button.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // on login button pressed
  void _register(BuildContext context) {
    bool isRegistered = context.read<AuthStore>().register(_nameController.text,
        _usernameController.text, _passwordController.text);
    if (isRegistered) {
      Navigator.pushNamed(context, '/login');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Ocurrio un error al registrarse, intente nuevamente'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: OnlyBackAppBar(),
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.only(top: 0),
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
                  'Registrate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
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
                            controller: _nameController,
                            labelText: 'Nombre y apellido',
                            hintText: 'Nombre y apellido'),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _usernameController,
                            labelText: 'Usuario',
                            hintText: 'Usuario'),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _passwordController,
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                            obscureText: true),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _confirmPasswordController,
                            labelText: 'Confirmar contraseña',
                            hintText: 'Confirmar contraseña',
                            obscureText: true),
                        const SizedBox(height: 16.0),
                        PrimaryButton(
                          action: _register,
                          label: 'Registrate',
                          parentContext: context,
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '¿Ya tienes una cuenta?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text(
                                'Inicia Sesión',
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
    )));
  }
}
