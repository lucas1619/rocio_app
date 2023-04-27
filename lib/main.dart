import 'package:flutter/material.dart';
import 'package:rocio_app/routes.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/crop.dart';
import 'package:rocio_app/store/devices.dart';
import 'package:rocio_app/store/field.dart';
import 'package:rocio_app/store/websocket.dart';
import 'package:rocio_app/store/location.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthStore()),
        ChangeNotifierProvider(create: (_) => FieldStore()),
        ChangeNotifierProvider(create: (_) => CropStore()),
        ChangeNotifierProvider(create: (_) => WebSocketStore()),
        ChangeNotifierProvider(create: (_) => LocationStore()),
        ChangeNotifierProvider(create: (_) => DevicesStore())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<WebSocketStore>(context, listen: false).connect();
  }

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
