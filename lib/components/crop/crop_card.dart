import 'package:flutter/material.dart';

class CropCard extends StatelessWidget {
  final String title;
  final String routeName;
  final String tipoCultivo;
  final String tipoSuelo;
  final String faseCultivo;

  CropCard({
    Key? key,
    required this.title,
    required this.routeName,
    required this.tipoCultivo,
    required this.tipoSuelo,
    required this.faseCultivo,
  }) : super(key: key);

  final Map<String, String> images = {
    "Alimentarios": 'assets/images/alimentario.jpg',
    "Ornamentales": 'assets/images/ornamental.png',
    "Textiles": 'assets/images/textil.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.favorite),
                      Text(tipoCultivo),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.share),
                      Text(tipoSuelo),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.comment),
                      Text(faseCultivo),
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
