import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/crop/crop_detail_card.dart';
import 'package:rocio_app/store/crop.dart';
import 'package:rocio_app/store/field.dart';
import 'package:rocio_app/utils/humidity_thresholds.dart';

class CropDetails extends StatelessWidget {
  const CropDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cropStoreOff = Provider.of<CropStore>(context, listen: false);
    final fieldStoreOff = Provider.of<FieldStore>(context, listen: false);
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      const Positioned.fill(
                          child: CircularProgressIndicator(
                        value: 0.3,
                        backgroundColor: Color(0xFFA3D0E0),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF0AABE4),
                        ),
                        strokeWidth: 10,
                      )),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${(humidityThresholds[cropStoreOff.selectedCrops.irrigationFrequency]!.min + humidityThresholds[cropStoreOff.selectedCrops.irrigationFrequency]!.max) ~/ 2}%",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0AABE4),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Humedad del suelo",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0AABE4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Mínimo: ${humidityThresholds[cropStoreOff.selectedCrops.irrigationFrequency]!.min} %\nMáximo: ${humidityThresholds[cropStoreOff.selectedCrops.irrigationFrequency]!.max}%",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CropDetailCard(
                    title: 'Fase de cultivo',
                    icon: Icons.speed,
                    textColor: const Color(0xff56BD86),
                    iconColor: const Color(0xff56BD86),
                    text: cropStoreOff.selectedCrops.growthStage),
                CropDetailCard(
                    title: 'Tipo de suelo',
                    icon: Icons.spa_outlined,
                    textColor: const Color(0xff61C02C),
                    iconColor: const Color(0xff61C02C),
                    text: cropStoreOff.selectedCrops.soilType)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CropDetailCard(
                    title: 'Temperatura',
                    icon: Icons.wb_sunny_outlined,
                    textColor: const Color(0xff37B6C9),
                    iconColor: const Color(0xff37B6C9),
                    text: "${fieldStoreOff.selectedField.temperature} °C"),
                CropDetailCard(
                    title: 'Humedad',
                    icon: Icons.water_drop_outlined,
                    textColor: const Color(0xff595959),
                    iconColor: const Color(0xff595959),
                    text: "${fieldStoreOff.selectedField.humidity}%")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CropDetailCard(
                    title: 'Tipo de cultivo',
                    icon: Icons.forest_outlined,
                    textColor: Colors.orange,
                    iconColor: Colors.orange,
                    text: cropStoreOff.selectedCrops.cropType),
              ],
            ),
          ],
        ));
  }
}
