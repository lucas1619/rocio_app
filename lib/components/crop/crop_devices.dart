import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/devices/sensor_card.dart';
import 'package:rocio_app/components/devices/sprinkler_card.dart';
import 'package:rocio_app/store/crop.dart';
import 'package:rocio_app/store/devices.dart';

class CropDevices extends StatefulWidget {
  const CropDevices({Key? key}) : super(key: key);

  @override
  CropDevicesState createState() => CropDevicesState();
}

class CropDevicesState extends State<CropDevices> {
  late DevicesStore _devicesStore;

  @override
  Widget build(BuildContext context) {
    final cropStore = Provider.of<CropStore>(context, listen: false);
    _devicesStore = Provider.of<DevicesStore>(context);
    _devicesStore.getDeviceByCropAndType(cropStore.selectedCrops.id, 1);
    _devicesStore.getDeviceByCropAndType(cropStore.selectedCrops.id, 2);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Text(
            "Sensores (${_devicesStore.sensors.length})",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  showOnly: true,
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            "Aspersores (${_devicesStore.sprinklers.length})",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                _devicesStore.sprinklers.length,
                (index) {
                  final sprinkler = _devicesStore.sprinklers[index];
                  return SprinklerCard(
                    device: sprinkler,
                    devicesStore: _devicesStore,
                    showOnly: true,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
