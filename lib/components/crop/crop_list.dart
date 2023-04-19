import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/store/field.dart';

class CropList extends StatefulWidget {
  const CropList({Key? key}) : super(key: key);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList> {
  int fieldId = -1;

  @override
  void initState() {
    super.initState();
    fieldId = Provider.of<FieldStore>(context, listen: false).selectedField.id;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 29, right: 29),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cultivos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline_rounded),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/crop/create');
              },
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: [Text('foalaasd')],
          ),
        )
      ]),
    );
  }
}
