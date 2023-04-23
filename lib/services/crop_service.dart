import 'package:http/http.dart' as http;
import 'package:rocio_app/services/api.dart';
import 'package:rocio_app/domain/crop/crop.dart';

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
    final http.Response response = await get('/crop/?fieldId=$fieldId');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Crop.listFromJson(response.body);
  }
}
