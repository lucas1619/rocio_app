import 'package:flutter/material.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';

class AppBarField extends StatefulWidget implements PreferredSizeWidget {
  const AppBarField({super.key});

  @override
  AppBarFieldState createState() => AppBarFieldState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarFieldState extends State<AppBarField> {
  int _fieldId = 1;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DropdownButton(
        // change icon
        icon: const Icon(Icons.expand_more, color: Colors.black),
        value: _fieldId,
        items: context.watch<FieldStore>().fields
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
