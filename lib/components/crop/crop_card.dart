import 'package:flutter/material.dart';
import 'package:rocio_app/utils/images_crop.dart';

class CropCard extends StatelessWidget {
  final String title;
  final String tipoCultivo;
  final String tipoSuelo;
  final String faseCultivo;
  final bool isIrrigating;
  final Function(BuildContext) onTap;

  const CropCard({
    Key? key,
    required this.title,
    required this.tipoCultivo,
    required this.tipoSuelo,
    required this.faseCultivo,
    required this.onTap,
    this.isIrrigating = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.0,
                width: double.infinity,
                child: Image.asset(
                  images[tipoCultivo]!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(Icons.shower_outlined,
                      color: isIrrigating
                          ? const Color(0xff61C02C)
                          : const Color(0xff595959)),
                  Text(
                    isIrrigating ? 'Riego activado' : 'Riego desactivado',
                    style: TextStyle(
                        color: isIrrigating
                            ? const Color(0xff61C02C)
                            : const Color(0xff595959)),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.forest_outlined),
                      const SizedBox(width: 3.0),
                      Text(tipoCultivo, style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.spa_outlined),
                      const SizedBox(width: 3.0),
                      Text(tipoSuelo, style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.speed),
                      const SizedBox(width: 3.0),
                      Text(faseCultivo, style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
