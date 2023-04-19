import 'package:flutter/material.dart';
import 'package:rocio_app/components/app_bar/app_bar_field.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/navigation_bar/navigation_bar.dart';
import 'package:rocio_app/components/crop/crop_list.dart';

class FieldPage extends StatelessWidget {
  const FieldPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // obtengo todos los fields de mi usuario
    return Builder(builder: (BuildContext context) {
      if (Provider.of<FieldStore>(context).noFields) {
        return Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Parece que no tienes campos,',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/field/create');
                  },
                  child: const Text(
                    'Crea uno',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return const Scaffold(
          appBar: AppBarField(),
          body: Center(
            child: CropList(),
          ),
          bottomNavigationBar: RocioNavigationBar(selectedIndex: 0),
        );
      }
    });
  }
}
