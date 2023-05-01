import 'package:flutter/material.dart';
import 'package:rocio_app/domain/devices/devices.dart';
import 'package:rocio_app/store/devices.dart';

class SensorCard extends StatelessWidget {
  final Device device;
  final DevicesStore devicesStore;
  SensorCard({
    Key? key,
    required this.device,
    required this.devicesStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/sensor.png",
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: const [
                      Icon(
                        Icons.water_drop_outlined,
                        size: 25,
                        color: Color(0xff0AABE4),
                      ),
                      Text(
                        "Porcentaje:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0AABE4)),
                      ),
                      SizedBox(width: 8.0),
                      Text("50%"),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // implement delete action
                devicesStore.unlinkDevice(device.id);
              },
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}
