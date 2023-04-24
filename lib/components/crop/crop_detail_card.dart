import 'package:flutter/material.dart';

class CropDetailCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final String text;

  const CropDetailCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.textColor,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 165,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
