import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/devices/sensor_card.dart';
import 'package:rocio_app/components/navigation_bar/navigation_bar.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/devices.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({Key? key}) : super(key: key);

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  late AuthStore _authStoreOff;
  late DevicesStore _devicesStore;
  @override
  void dispose() {
    _devicesStore.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authStoreOff = Provider.of<AuthStore>(context, listen: false);
    _devicesStore = Provider.of<DevicesStore>(context);
    _devicesStore.getFields(_authStoreOff.user.id);
    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Sensores',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              items: _devicesStore.fields,
              itemAsString: (item) => item.name,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Campo",
                  hintText: "Campo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                _devicesStore.getCrops(value!.id);
              },
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              itemAsString: (item) => item.name,
              items: _devicesStore.crops,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Cultivo",
                  hintText: "Cultivo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                _devicesStore.getDeviceByCropAndType(value!.id, 1);
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Sensores vinculados",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _devicesStore.sensors.length,
                itemBuilder: (context, index) {
                  final sensor = _devicesStore.sensors[index];
                  return SensorCard(
                    device: sensor,
                    devicesStore: _devicesStore,
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Acción a ejecutar cuando se presiona el botón
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  ), // Icono de circle plus
                  SizedBox(width: 8), // Separación entre el icono y el texto
                  Text("Vincular Sensor",
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: const RocioNavigationBar(selectedIndex: 1),
    );
  }
}
