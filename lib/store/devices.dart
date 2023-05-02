import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/crop/crop.dart';
import 'package:rocio_app/domain/devices/devices.dart';
import 'package:rocio_app/domain/field/field.dart';
import 'package:rocio_app/services/field_service.dart';
import 'package:rocio_app/services/crop_service.dart';
import 'package:rocio_app/services/device_service.dart';

class DevicesStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<Field> _fields = [];
  List<Crop> _crops = [];
  List<Device> sensors = [];
  List<Device> sprinklers = [];
  List<Device> unlinkedDevices = [];

  List<Field> get fields => [..._fields];
  List<Crop> get crops => [..._crops];

  void clear() {
    _fields = [];
    _crops = [];
    sensors = [];
    sprinklers = [];
  }

  Future<void> getFields(int userId) async {
    if (_fields.isNotEmpty) return;
    FieldService fieldService = FieldService();
    List<Field> fields = await fieldService.getFields(userId);
    _fields = fields;
    notifyListeners();
  }

  Future<void> getCrops(int fieldId) async {
    CropService cropService = CropService();
    List<Crop> crops = await cropService.getCrops(fieldId);
    _crops = crops;
    notifyListeners();
  }

  Future<void> getDeviceByCropAndType(int cropId, int deviceType) async {
    DeviceService deviceService = DeviceService();
    if (deviceType == 1) {
      List<Device> sensors =
          await deviceService.getDeviceByCropAndType(cropId, deviceType);
      this.sensors = sensors;
    } else if (deviceType == 2) {
      List<Device> sprinklers =
          await deviceService.getDeviceByCropAndType(cropId, deviceType);
      this.sprinklers = sprinklers;
    }
    notifyListeners();
  }

  Future<void> unlinkDevice(int deviceId) async {
    sensors.removeWhere((element) => element.id == deviceId);
    sprinklers.removeWhere((element) => element.id == deviceId);
    DeviceService deviceService = DeviceService();
    await deviceService.unlinkDevice(deviceId);
    notifyListeners();
  }

  Future<void> getUnlinkedDevices(int deviceType) async {
    DeviceService deviceService = DeviceService();
    List<Device> unlinkedDevices =
        await deviceService.getUnlinkedDevices(deviceType);
    this.unlinkedDevices = unlinkedDevices;
    notifyListeners();
  }

  Future<void> linkDevice(int deviceId, int cropId) async {
    DeviceService deviceService = DeviceService();
    await deviceService.linkDevice(deviceId, cropId);
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('fields', fields));
    properties.add(IterableProperty('crops', crops));
  }
}
