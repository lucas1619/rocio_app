import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/numeric_input.dart';
import '../../widgets/text.dart';
import '../../widgets/text_field.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          title: const Text("Form"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextWidget(
                text: 'Crear campo',
                fontSize: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextWidget(
                text: 'Datos generales',
                fontSize: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              InputTextField(),
              const SizedBox(
                height: 20,
              ),
              NumericInput(
                hintText: 'Ingresa número de área',
                onChanged: (value) {
                  // Haz algo con el valor ingresado
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'Siguiente',
                onPressed: () {
                  // código que se ejecutará cuando se presione el botón
                },
                color: const Color(0xFF0AABE4),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Cancelar',
                onPressed: () {
                  // código que se ejecutará cuando se presione el botón
                },
                color: const Color(0xFF595959),
              )
            ],
          ),
        ));
  }
}
