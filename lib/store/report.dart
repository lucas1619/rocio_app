import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/crop/crop.dart';
import 'package:rocio_app/domain/field/field.dart';
import 'package:rocio_app/domain/report/TraditionalRocio.dart';
import 'package:rocio_app/services/field_service.dart';
import 'package:rocio_app/services/crop_service.dart';
import 'package:rocio_app/services/report_service.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  double? y;
}

class ReportStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<Field> _fields = [];
  List<Crop> _crops = [];

  int consumoRocio = 0;

  double ahorro = 0.0;

  List<ChartData> traditionalData = [
    ChartData('Lun', 0),
    ChartData('Mar', 0),
    ChartData('Mie', 0),
    ChartData('Jue', 0),
    ChartData('Vie', 0),
    ChartData('Sab', 0),
    ChartData('Dom', 0),
  ];
  List<ChartData> rocioData = [
    ChartData('Lun', 0),
    ChartData('Mar', 0),
    ChartData('Mie', 0),
    ChartData('Jue', 0),
    ChartData('Vie', 0),
    ChartData('Sab', 0),
    ChartData('Dom', 0),
  ];

  List<Field> get fields => [..._fields];
  List<Crop> get crops => [..._crops];

  void reset() {
    _fields = [];
    _crops = [];
    traditionalData = [
      ChartData('Lun', 0),
      ChartData('Mar', 0),
      ChartData('Mie', 0),
      ChartData('Jue', 0),
      ChartData('Vie', 0),
      ChartData('Sab', 0),
      ChartData('Dom', 0),
    ];
    rocioData = [
      ChartData('Lun', 0),
      ChartData('Mar', 0),
      ChartData('Mie', 0),
      ChartData('Jue', 0),
      ChartData('Vie', 0),
      ChartData('Sab', 0),
      ChartData('Dom', 0),
    ];
    consumoRocio = 0;
    ahorro = 0.0;
    notifyListeners();
  }

  Future<void> getFields(int userId) async {
    if (_fields.isNotEmpty) {
      return;
    }
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

  Future<void> getReport(int cropId) async {
    ReportService reportService = ReportService();
    List<TraditionalRocio> data = await reportService.getReport(cropId);
    double sumaTradicional = 0;
    double sumaRocio = 0;
    for (int i = 0; i < data.length; i++) {
      traditionalData[i].y = data[i].traditional.toDouble();
      rocioData[i].y = data[i].irrigation.toDouble();
      sumaTradicional += data[i].traditional;
      sumaRocio += data[i].irrigation;
    }
    ahorro = (sumaTradicional - sumaRocio) / sumaTradicional * 100;
    consumoRocio = sumaRocio.toInt();
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
