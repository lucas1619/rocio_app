import 'package:flutter/material.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';

class AppBarField extends StatefulWidget implements PreferredSizeWidget {
  const AppBarField();

  @override
  AppBarFieldState createState() => AppBarFieldState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class AppBarFieldState extends State<AppBarField> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 300,
      title: DropdownButton(
        // change icon
        icon: const Icon(Icons.expand_more, color: Colors.white),
        dropdownColor: const Color(0xFF595959),
        isExpanded: false,
        alignment: AlignmentDirectional.centerStart,
        underline: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
        value: Provider.of<FieldStore>(context).selectedField.id,
        items: [
          ...Provider.of<FieldStore>(context)
              .fields
              .map((value) => DropdownMenuItem(
                    // text color black
                    value: value.id,
                    child: Text(value.name),
                  ))
              .toList(),
          DropdownMenuItem(
            value: -1,
            child: Row(
              children: const [
                Icon(Icons.add_circle_outline_sharp),
                SizedBox(width: 8),
                Text('Crear campo'),
              ],
            ),
          ),
        ],
        onChanged: (fieldId) {
          if (fieldId == -1) {
            Navigator.pushNamed(context, '/field/create');
          }
          Provider.of<FieldStore>(context, listen: false)
              .updateSelected(fieldId: fieldId!);
        },
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200), // Alto del AppBar
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        Provider.of<FieldStore>(context)
                            .selectedField
                            .locationId,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.aspect_ratio,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${Provider.of<FieldStore>(context).selectedField.area.toString()} m2',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.water_drop,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${Provider.of<FieldStore>(context).selectedField.humidity.toString()}%',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.sunny,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${Provider.of<FieldStore>(context).selectedField.temperature.toString()} °C',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
