import 'package:flutter/material.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/domain/field/field.dart';

class AppBarField extends StatefulWidget implements PreferredSizeWidget {
  const AppBarField();

  @override
  AppBarFieldState createState() => AppBarFieldState();

  @override
  Size get preferredSize => const Size.fromHeight(115);
}

class AppBarFieldState extends State<AppBarField> {
  int _fieldId = 0;
  Field selected =

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 300,
      title: DropdownButton(
        // change icon
        icon: const Icon(Icons.expand_more, color: Colors.black),
        value: _fieldId,
        items: [
          ...Provider.of<FieldStore>(context).fields
              .map((value) => DropdownMenuItem(
            // text color black
            value: value.id,
            child: Text(value.name,
                style: const TextStyle(color: Colors.black)),
          )).toList(),
          DropdownMenuItem(
            value: -1,
            child: Row(
              children: const [
                Icon(Icons.add_circle_outline_sharp, color: Colors.black,),
                SizedBox(width: 8),
                Text('Crear campo'),
              ],
            ),
          ),
        ],
        onChanged: (value) {
          if(value == -1) {
            Navigator.pushNamed(context, '/field/create');
          }
          setState(() {
            _fieldId = value!;
            selected = Provider.of<FieldStore>(context).fields.firstWhere(
                    (element) => element.id == _fieldId,
                orElse: () => Field(address: 'a', name: 'a', fieldSize: 10)
            );
          });
        },
      ),
      bottom:  PreferredSize(
        preferredSize: const Size.fromHeight(200), // Alto del AppBar
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(selected.address),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.area_chart),
                    Text(selected.fieldSize.toString())
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.water_drop),
                    Text(selected.humidity.toString())
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.sunny),
                    Text(selected.temperature.toString())
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
