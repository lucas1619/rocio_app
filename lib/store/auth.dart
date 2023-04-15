import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/auth/user.dart';

class AuthStore with ChangeNotifier, DiagnosticableTreeMixin {
  final User _user = User(id: 0, name: '', username: '');

  User get user => _user;

  void setUser(User user) {
    _user.id = user.id;
    _user.name = user.name;
    _user.username = user.username;
    notifyListeners();
  }

  bool login(String username, String password) {
    if (username == 'admin' && password == 'admin') {
      setUser(User(id: 1, name: 'Admin', username: 'admin'));
      return true;
    }
    return false;
  }

  bool register(String name, String username, String password) {
    // TODO: implement register
    return true;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty('user', _user));
  }
}
