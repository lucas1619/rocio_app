import 'package:http/http.dart' as http;
import 'package:rocio_app/services/api.dart';
import 'package:rocio_app/domain/field/field.dart';

class FieldService extends Api {
  Future<List<Field>> getFields(int userId) async {
    final http.Response response = await get('/field/$userId/all');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Field.listFromJson(response.body);
  }

  Future<Field> createField(Field field) async {
    final http.Response response = await post('/field/', field.toMap());
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return Field.fromJson(response.body);
  }
}
