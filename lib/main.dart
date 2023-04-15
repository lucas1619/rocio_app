import 'package:flutter/material.dart';
import 'package:rocio_app/routes.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/field.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthStore()),
        ChangeNotifierProvider(create: (_)=> FieldStore())
      ],
      child: const MyApp(),
    ),
  );
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
