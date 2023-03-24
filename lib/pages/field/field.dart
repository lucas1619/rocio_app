import 'package:flutter/material.dart';
import 'package:rocio_app/components/app_bar/app_bar_field.dart';

class FieldPage extends StatelessWidget {
  const FieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarField(),
      body: Center(
        child: Text('No tienes campos? Crea uno!'),
      ),
    );
  }
}
