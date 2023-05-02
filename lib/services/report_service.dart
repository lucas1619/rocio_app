import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rocio_app/domain/report/traditional_rocio.dart';
import 'package:rocio_app/services/api.dart';

class ReportService extends Api {
  Future<List<TraditionalRocio>> getReport(int cropId) async {
    // get current date

    DateTime now = DateTime.now();

    final http.Response response = await get(
        '/irrigation/report/crop/$cropId?month=${now.month}&year=${now.year}&day=${now.day}');
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    List<TraditionalRocio> traditionalRocio =
        TraditionalRocio.listFromJson(jsonDecode(response.body));

    return traditionalRocio;
  }
}
