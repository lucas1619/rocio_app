import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rocio_app/domain/location/distrito.dart';
import 'package:rocio_app/services/api.dart';

class LocationService extends Api {
  Future<List<String>> getDepartamentos() async {
    final http.Response response = await get('/location/departamentos');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    List<String> departamentos =
        jsonDecode(response.body).map<String>((e) => e.toString()).toList();

    return departamentos;
  }

  Future<List<String>> getProvincias(String departamento) async {
    final http.Response response =
        await get('/location/provincias/$departamento');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    List<String> provincias =
        jsonDecode(response.body).map<String>((e) => e.toString()).toList();
    return provincias;
  }

  Future<List<Distrito>> getDistritos(
      String departamento, String provincia) async {
    final http.Response response =
        await get('/location/distritos/$departamento/$provincia');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }

    return Distrito.listFromJson(response.body);
  }
}
