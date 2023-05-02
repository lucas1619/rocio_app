import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/select/primary_select.dart';
import 'package:rocio_app/components/text_field/primary_text_field.dart';

import 'package:rocio_app/domain/crop/crop.dart';

import 'package:rocio_app/store/crop.dart';
import 'package:rocio_app/store/field.dart';

class CreateCropPage extends StatefulWidget {
  const CreateCropPage({Key? key}) : super(key: key);

  @override
  CreateCropPageState createState() => CreateCropPageState();
}

class CreateCropPageState extends State<CreateCropPage> {
  final TextEditingController _nameController = TextEditingController();

  String _tipoCultivo = 'Alimentarios';
  String _tipoSuelo = 'Franco';
  String _faseCultivo = 'Germinacion';

  final List<String> _tiposCultivo = [
    'Arroz',
    'Algodon',
    'Canamo',
    'Tomate',
    'Seda',
    'Rabanito',
    'Helechos',
    'Maiz',
    'Lino',
    'Rosas',
    'Hortensias',
    'Orquideas'
  ];
  final List<String> _tiposSuelo = [
    'Arcilloso',
    'Franco arenoso',
    'Franco',
    'Franco arcilloso',
    'Arcilloso Arenoso',
    'Arenoso'
  ];
  final List<String> _fasesCultivo = [
    'Maduracion',
    'Ahijamiento',
    'Germinacion'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Crear Cultivo',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            PrimaryTextField(
                controller: _nameController,
                labelText: 'Nombre',
                hintText: 'Nombre'),
            const SizedBox(height: 20),
            PrimarySelect(
              value: _tipoCultivo,
              onChanged: (String? newValue) {
                setState(() {
                  _tipoCultivo = newValue!;
                });
              },
              items: _tiposCultivo,
              label: 'Tipo de cultivo',
            ),
            const SizedBox(height: 20),
            PrimarySelect(
              value: _tipoSuelo,
              onChanged: (String? newValue) {
                setState(() {
                  _tipoSuelo = newValue!;
                });
              },
              items: _tiposSuelo,
              label: 'Tipo de suelo',
            ),
            const SizedBox(height: 20),
            PrimarySelect(
              value: _faseCultivo,
              onChanged: (String? newValue) {
                setState(() {
                  _faseCultivo = newValue!;
                });
              },
              items: _fasesCultivo,
              label: 'Fase de cultivo',
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                try {
                  //Aquí puedes guardar los datos del formulario
                  await Provider.of<CropStore>(context, listen: false)
                      .createCrop(Crop(
                          name: _nameController.text,
                          cropType: _tipoCultivo,
                          soilType: _tipoSuelo,
                          growthStage: _faseCultivo,
                          fieldId:
                              Provider.of<FieldStore>(context, listen: false)
                                  .selectedField
                                  .id));
                  Navigator.pop(context);
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'Ocurrio un error al guardar, intente de nuevo'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 0),
              ),
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
