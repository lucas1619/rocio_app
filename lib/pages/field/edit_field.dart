import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/dropdown_button.dart';
import '../../widgets/numeric_input.dart';
import '../../widgets/text.dart';

class EditFieldScreen extends StatefulWidget {
  const EditFieldScreen({Key? key}) : super(key: key);

  @override
  State<EditFieldScreen> createState() => _EditFieldScreen();
}

class _EditFieldScreen extends State<EditFieldScreen> {
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
                text: 'Editar campo',
                fontSize: 30,
              ),
              const SizedBox(
                height: 25,
              ),
              NumericInput(
                hintText: 'Ingresa número de área',
                onChanged: (value) {
                  // Haz algo con el valor ingresado
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'Seleccione un departamento',
                items: ['Option 1', 'Option 2', 'Option 3'],
                onChanged: (value) {
                  // handle the selected value
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'Seleccione una provincia',
                items: ['Option 1', 'Option 2', 'Option 3'],
                onChanged: (value) {
                  // handle the selected value
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'Seleccione un distrito',
                items: ['Option 1', 'Option 2', 'Option 3'],
                onChanged: (value) {
                  // handle the selected value
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'Guardar',
                onPressed: () {
                  // código que se ejecutará cuando se presione el botón
                },
                color: const Color(0xFF0AABE4),
              ),
            ],
          ),
        ));
  }
}
