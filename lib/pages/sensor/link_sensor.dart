import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocio_app/components/app_bar/only_back_app_bar.dart';
import 'package:rocio_app/components/button/primary_button.dart';
import 'package:rocio_app/domain/crop/crop.dart';
import 'package:rocio_app/domain/devices/devices.dart';
import 'package:rocio_app/store/auth.dart';
import 'package:rocio_app/store/devices.dart';

class LinkSensorPage extends StatefulWidget {
  const LinkSensorPage({Key? key}) : super(key: key);

  @override
  LinkSensorState createState() => LinkSensorState();
}

class LinkSensorState extends State<LinkSensorPage> {
  late AuthStore _authStoreOff;
  late DevicesStore _devicesStore;
  late Device selectedDevice;
  late Crop selectedCrop;
  @override
  void dispose() {
    _devicesStore.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authStoreOff = Provider.of<AuthStore>(context, listen: false);
    _devicesStore = Provider.of<DevicesStore>(context);
    _devicesStore.getFields(_authStoreOff.user.id);
    _devicesStore.getUnlinkedDevices(1);
    return Scaffold(
      appBar: const OnlyBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Vincular Sensor',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              items: _devicesStore.fields,
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
                _devicesStore.getCrops(value!.id);
              },
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              itemAsString: (item) => item.name,
              items: _devicesStore.crops,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Cultivo",
                  hintText: "Cultivo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedCrop = value!;
                });
              },
            ),
            const SizedBox(height: 20.0),
            DropdownSearch(
              itemAsString: (item) => item.name,
              items: _devicesStore.unlinkedDevices,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Sensor",
                  hintText: "Sensor",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedDevice = value!;
                });
              },
            ),
            const SizedBox(height: 20.0),
            PrimaryButton(
                action: (BuildContext context) async {
                  await _devicesStore.linkDevice(
                      selectedDevice.id, selectedCrop.id);
                  Navigator.pop(context);
                },
                label: 'Vincular',
                parentContext: context)
          ],
        ),
      ),
    );
  }
}
