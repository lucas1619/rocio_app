import 'package:flutter/material.dart';
import 'package:rocio_app/domain/field/field.dart';

class AppBarField extends StatefulWidget implements PreferredSizeWidget {
  const AppBarField({super.key});

  @override
  AppBarFieldState createState() => AppBarFieldState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarFieldState extends State<AppBarField> {
  final List<Field> _fields = [
    Field(
        id: 1,
        name: 'My Field',
        address: '123 Main St',
        fieldSize: 100,
        humidity: 50,
        temperature: 25),
    Field(
        id: 2,
        name: 'My Field 2',
        address: '123 Main St',
        fieldSize: 100,
        humidity: 50,
        temperature: 25),
  ];
  int _fieldId = 1;
  Field get _field => _fields.firstWhere((element) => element.id == _fieldId);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DropdownButton(
        // change icon
        icon: const Icon(Icons.expand_more, color: Colors.black),
        value: _fieldId,
        items: _fields
            .map((value) => DropdownMenuItem(
                  // text color black
                  value: value.id,
                  child: Text(value.name,
                      style: const TextStyle(color: Colors.black)),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _fieldId = value!;
          });
        },
      ),
    );
  }
}
