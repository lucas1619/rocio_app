import 'package:http/http.dart' as http;
import 'package:rocio_app/services/api.dart';
import 'package:rocio_app/domain/auth/user.dart';

class AuthService extends Api {
  Future<User> login(String username, String password) async {
    final http.Response response = await post(
      '/user/login',
      {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 400) {
      throw Exception('Usuario o contraseña incorrectos');
    }
    return User.fromJson(response.body);
  }

  Future<User> register(String name, String username, String password) async {
    final http.Response response = await post(
      '/user/register',
      {
        'name': name,
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return User.fromJson(response.body);
  }
}
