import 'package:flutter/cupertino.dart';
import 'package:rocio_app/pages/login/login.dart';
import 'package:rocio_app/pages/signup/signup.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/signup': (BuildContext context) => SignupPage(),
};
