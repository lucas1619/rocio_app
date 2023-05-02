import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rocio_app/services/api.dart';
import 'package:rocio_app/domain/devices/devices.dart';

class DeviceService extends Api {
  // Obtener dispositivos vinculados a un cultivo
  Future<List<Device>> getDeviceByCrop(int cropId) async {
    final http.Response response = await get('/device/getDeviceByCrop/$cropId');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Device.listFromJson(response.body);
  }

  // Obtener dispositivos no vinculados a ningún cultivo
  Future<List<Device>> getUnlinkedDevices(int deviceType) async {
    final http.Response response =
        await get('/device/getUnlinkedDevices/$deviceType');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Device.listFromJson(response.body);
  }

  // Vincular un dispositivo a un cultivo
  Future<void> linkDevice(int deviceId, int cropId) async {
    final http.Response response = await post('/device/linkDevice', {
      'device_id': deviceId,
      'crop_id': cropId,
    });
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
  }

  // Obtener dispositivos vinculados a un cultivo de un tipo específico
  Future<List<Device>> getDeviceByCropAndType(
      int cropId, int deviceType) async {
    final http.Response response =
        await get('/device/getDeviceByCropAndType/$cropId/$deviceType');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Device.listFromJson(response.body);
  }

  // Crear un nuevo dispositivo
  Future<Device> createDevice(Device device) async {
    final http.Response response = await post('/device/createDevice', {
      ...device.toPartialMap(),
    });
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Device.fromJson(jsonDecode(response.body));
  }

  // Desvincular un dispositivo de un cultivo
  Future<void> unlinkDevice(int deviceId) async {
    final http.Response response = await post('/device/unlinkDevice', {
      'device_id': deviceId,
    });
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
  }
}
