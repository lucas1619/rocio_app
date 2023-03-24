import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // por defecto el color será azul
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary:
            color, // establece el color de fondo según el parámetro recibido
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
