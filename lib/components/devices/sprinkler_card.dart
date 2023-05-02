import 'package:flutter/material.dart';
import 'package:rocio_app/domain/devices/devices.dart';
import 'package:rocio_app/store/devices.dart';

class SprinklerCard extends StatelessWidget {
  final Device device;
  final DevicesStore devicesStore;
  final bool showOnly;
  const SprinklerCard({
    Key? key,
    required this.device,
    required this.devicesStore,
    this.showOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/aspersor.png",
              width: 50,
              height: 50,
            ),
            Text(
              device.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: !showOnly ? 2 : 5,
              textAlign: TextAlign.center,
            ),
            Builder(builder: (BuildContext context) {
              if (showOnly) {
                return Container();
              }
              return IconButton(
                onPressed: () {
                  // implement delete action
                  devicesStore.unlinkDevice(device.id);
                },
                icon: const Icon(Icons.delete_outline),
              );
            })
          ],
        ),
      ),
    );
  }
}
