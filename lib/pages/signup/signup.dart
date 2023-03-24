import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // on login button pressed
  void _register() {
    if (kDebugMode) {
      print('Name: ${_nameController.text}');
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
    }
  }

  void _login(BuildContext context) {
    if (kDebugMode) {
      print('Register');
    }
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
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
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _nameController.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            labelText: 'Nombre y apellido',
                            hintText: 'Nombre y apellido',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ), // Padding personalizado
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _usernameController.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            labelText: 'Usuario',
                            hintText: 'Usuario',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ), // Padding personalizado
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _passwordController.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            labelText: 'Contraseña',
                            hintText: 'Contraseña',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ), // Padding personalizado
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: _confirmPasswordController.clear,
                              icon: const Icon(Icons.clear),
                            ),
                            labelText: 'Confirmar contraseña',
                            hintText: 'Confirmar contraseña',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ), // Padding personalizado
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    16.0), // añadir un padding horizontal
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // agregar bordes redondeados
                            ),
                          ),
                          child: const SizedBox(
                            width: double.infinity, // ancho completo
                            child: Text(
                              'Registrate',
                              textAlign: TextAlign.center, // centrar el texto
                            ),
                          ),
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
                                _login(context);
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
