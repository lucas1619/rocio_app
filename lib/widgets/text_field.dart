import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Campo 1',
        labelText: 'Nombre',
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.done,
    );
  }
}
