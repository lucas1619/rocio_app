import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/navigation_bar/navigation_bar.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/devices.dart';

class SprinklerPage extends StatelessWidget {
  const SprinklerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authStoreOff = Provider.of<AuthStore>(context, listen: false);
    final devicesStore = Provider.of<DevicesStore>(context);

    devicesStore.getFields(authStoreOff.user.id);

    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Center(
              child: Text(
                'Aspersores',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              items: devicesStore.fields,
              itemAsString: (item) => item.name,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Campo",
                  hintText: "Campo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                devicesStore.getCrops(value!.id);
              },
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              itemAsString: (item) => item.name,
              items: devicesStore.crops,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Cultivo",
                  hintText: "Cultivo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: const RocioNavigationBar(selectedIndex: 2),
    );
  }
}
