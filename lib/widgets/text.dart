import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;

  MyTextWidget({this.text = '', this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
