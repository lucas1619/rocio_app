import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/auth/user.dart';
import 'package:rocio_app/services/auth_service.dart';

class AuthStore with ChangeNotifier, DiagnosticableTreeMixin {
  final User _user = User(id: 0, name: '', username: '');

  User get user => _user;

  void setUser(User user) {
    _user.id = user.id;
    _user.name = user.name;
    _user.username = user.username;
    notifyListeners();
  }

  Future<User> login(String username, String password) async {
    AuthService authService = AuthService();
    User user = await authService.login(username, password);
    setUser(user);
    return user;
  }

  Future<User> register(String name, String username, String password) async {
    AuthService authService = AuthService();
    return await authService.register(name, username, password);
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty('user', _user));
  }
}
