import 'package:flutter/material.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/text_field/primary_text_field.dart';
import 'package:rocio_app/components/button/primary_button.dart';
import 'package:rocio_app/components/button/secondary_button.dart';
import 'package:rocio_app/domain/field/field.dart';
import 'package:rocio_app/domain/location/distrito.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/store/location.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CreateFieldPage extends StatefulWidget {
  const CreateFieldPage({Key? key}) : super(key: key);

  @override
  State<CreateFieldPage> createState() => _CreateFieldPageState();
}

class _CreateFieldPageState extends State<CreateFieldPage> {
  // step 1
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _areaFieldController = TextEditingController();

  String departamento = '';
  String provincia = '';
  Distrito distrito = Distrito(name: '', ubigeo: '');
  String ubigeo = '';

  int _currentStep = 0;
  List<Step> buildSteps(BuildContext context) {
    final locationStore = Provider.of<LocationStore>(context);
    locationStore.getDepartamentos();
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
            DropdownSearch<String>(
              items: locationStore.departamentos,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Departamento",
                  hintText: "Departamento",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  distrito = Distrito(name: '', ubigeo: '');
                  provincia = '';
                  departamento = value!;
                });

                locationStore.getProvincias(value!);
              },
            ),
            const SizedBox(height: 10.0),
            DropdownSearch<String>(
              selectedItem: provincia,
              items: locationStore.provincias,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Provincia",
                  hintText: "Provincia",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  distrito = Distrito(name: '', ubigeo: '');
                  provincia = value!;
                });
                locationStore.getDistritos(departamento, provincia);
              },
            ),
            const SizedBox(height: 10.0),
            DropdownSearch(
              selectedItem: distrito,
              items: locationStore.distritos,
              itemAsString: (item) => item.name,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Distrito",
                  hintText: "Distrito",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  ubigeo = value!.ubigeo;
                });
              },
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
            locationId: ubigeo,
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
        steps: buildSteps(context),
        type: StepperType.horizontal,
      ),
    );
  }
}
