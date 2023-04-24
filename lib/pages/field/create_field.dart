import 'package:flutter/material.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/text_field/primary_text_field.dart';
import 'package:rocio_app/components/button/primary_button.dart';
import 'package:rocio_app/components/button/secondary_button.dart';
import 'package:rocio_app/domain/field/field.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';

class CreateFieldPage extends StatefulWidget {
  const CreateFieldPage({Key? key}) : super(key: key);

  @override
  State<CreateFieldPage> createState() => _CreateFieldPageState();
}

class _CreateFieldPageState extends State<CreateFieldPage> {
  // step 1
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _areaFieldController = TextEditingController();
  // step 2
  final TextEditingController _departmentFieldController =
      TextEditingController();
  final TextEditingController _provinceFieldController =
      TextEditingController();
  final TextEditingController _districtFieldController =
      TextEditingController();
  int _currentStep = 0;
  List<Step> buildSteps() {
    return [
      Step(
        title: const SizedBox.shrink(),
        state: StepState.indexed,
        content: Column(
          children: [
            PrimaryTextField(
                controller: _nameFieldController,
                labelText: 'Nombre',
                hintText: 'Nombre'),
            const SizedBox(height: 10.0),
            PrimaryTextField(
              controller: _areaFieldController,
              labelText: 'Área m2',
              hintText: 'Área m2',
              numeric: true,
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const SizedBox.shrink(),
        content: Column(
          children: [
            PrimaryTextField(
              controller: _departmentFieldController,
              labelText: 'Departamento',
              hintText: 'Departamento',
            ),
            const SizedBox(height: 10.0),
            PrimaryTextField(
              controller: _provinceFieldController,
              labelText: 'Provincia',
              hintText: 'Provincia',
            ),
            const SizedBox(height: 10.0),
            PrimaryTextField(
              controller: _districtFieldController,
              labelText: 'Distrito',
              hintText: 'Distrito',
            ),
          ],
        ),
        state: StepState.indexed,
        isActive: _currentStep >= 1,
      ),
    ];
  }

  Future<void> _createField(BuildContext context) async {
    try {
      await Provider.of<FieldStore>(context, listen: false).createField(
          Field(
            locationId: '150109',
            name: _nameFieldController.text,
            area: int.parse(_areaFieldController.text),
          ),
          Provider.of<AuthStore>(context, listen: false).user.id);
      // ignore: use_build_context_synchronously
      await Provider.of<FieldStore>(context, listen: false).getFields(
          // ignore: use_build_context_synchronously
          Provider.of<AuthStore>(context, listen: false).user.id);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/field');
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Ocurrio un error al crear el campo, inténtalo nuevamente o comunicate con soporte'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: Stepper(
        currentStep: _currentStep,
        elevation: 0,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (_currentStep < 1) {
              _currentStep++;
            } else {
              // Formulario completado
              _createField(context);
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            } else {
              _currentStep = 0;
              Navigator.pop(context);
            }
          });
        },
        controlsBuilder:
            (BuildContext context, ControlsDetails controlsDetails) {
          return Column(
            children: [
              const SizedBox(height: 20.0),
              PrimaryButton(
                action: (BuildContext context) =>
                    {controlsDetails.onStepContinue!()},
                label: _currentStep < 1 ? 'Siguiente' : 'Guardar',
                parentContext: context,
              ),
              SecondaryButton(
                  action: (BuildContext context) =>
                      {controlsDetails.onStepCancel!()},
                  label: 'Cancelar')
            ],
          );
        },
        steps: buildSteps(),
        type: StepperType.horizontal,
      ),
    );
  }
}
