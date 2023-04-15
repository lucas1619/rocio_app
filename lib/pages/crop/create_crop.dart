import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dropdown_button.dart';
import '../../widgets/text.dart';

class CreateCropScreen extends StatefulWidget {
  const CreateCropScreen({Key? key}) : super(key: key);

  @override
  State<CreateCropScreen> createState() => _CreateCropScreen();
}

class _CreateCropScreen extends State<CreateCropScreen> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          title: const Text("Form"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextWidget(
                text: 'Crear cultivo',
                fontSize: 30,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomDropdownButton(
                hint: 'Seleccione un tipo de cultivo',
                items: const ['Option 1', 'Option 2', 'Option 3'],
                onChanged: (value) {
                  // handle the selected value
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'Seleccione un tipo de suelo',
                items: const ['Option 1', 'Option 2', 'Option 3'],
                onChanged: (value) {
                  // handle the selected value
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'Seleccione una fase de cultivo',
                items: const ['Option 1', 'Option 2', 'Option 3'],
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
