import 'package:flutter/material.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/select/primary_select.dart';

class CreateCropPage extends StatefulWidget {
  const CreateCropPage({Key? key}) : super(key: key);

  @override
  _CreateCropPageState createState() => _CreateCropPageState();
}

class _CreateCropPageState extends State<CreateCropPage> {
  String _tipoCultivo = 'Alimentarios';
  String _tipoSuelo = 'Franco';
  String _faseCultivo = 'Germinacion';

  final List<String> _tiposCultivo = [
    'Alimentarios',
    'Ornamentales',
    'Textiles'
  ];
  final List<String> _tiposSuelo = ['Franco', 'Arcilloso', 'Arenoso'];
  final List<String> _fasesCultivo = [
    'Germinacion',
    'Ahijamiento',
    'Maduracion'
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
              onPressed: () {
                //Aquí puedes guardar los datos del formulario
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
