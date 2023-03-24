import 'package:flutter/material.dart';
import 'package:rocio_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocio',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF0AABE4),
        secondary: const Color(0xFF595959),
      )),
      initialRoute: '/login',
      routes: routes,
    );
  }
}
