import 'package:flutter/material.dart';
import 'package:rocio_app/components/app_bar/app_bar_field.dart';
import 'package:rocio_app/store/field.dart';
import 'package:provider/provider.dart';

class FieldPage extends StatelessWidget {
  const FieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      if(context.watch<FieldStore>().noFields) {
        return Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Parece que no tienes campos, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Regístrate',
                    style: TextStyle(
                      color: Color(0xFF595959),
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
            child: Text('Ya hay campos, esperate :v'),
          ),
        );
      }
    });
  }
}
