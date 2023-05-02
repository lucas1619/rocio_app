import 'package:http/http.dart' as http;
import 'package:rocio_app/services/api.dart';
import 'package:rocio_app/domain/crop/crop.dart';

import 'package:rocio_app/domain/crop/history.dart';

class CropService extends Api {
  Future<Crop> createCrop(Crop crop) async {
    final http.Response response = await post('/crop/', {
      ...crop.toPartialMap(),
    });
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Crop.fromJson(response.body);
  }

  Future<List<Crop>> getCrops(int fieldId) async {
    final http.Response response = await get('/crop/$fieldId/all');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Crop.listFromJson(response.body);
  }

  Future<List<History>> getHistory(int cropId, int month, int year) async {
    final http.Response response =
        await get('/irrigation/crop/$cropId?month=$month&year=$year');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return History.listFromJson(response.body);
  }

  Future<void> stopIrrigation(int cropId) async {
    final http.Response response =
        await post('/crop/$cropId/irrigation/stop', {});
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
  }

  Future<void> startIrrigation(int cropId) async {
    final http.Response response =
        await post('/crop/$cropId/irrigation/start', {});
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
  }
}
