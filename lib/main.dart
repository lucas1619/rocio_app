import 'package:flutter/material.dart';
import 'package:rocio_app/routes.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/crop.dart';
import 'package:rocio_app/store/field.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthStore()),
        ChangeNotifierProvider(create: (_) => FieldStore()),
        ChangeNotifierProvider(create: (_) => CropStore())
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
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: routes,
    );
  }
}
