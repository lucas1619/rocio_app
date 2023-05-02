import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/crop/crop.dart';
import 'package:rocio_app/services/crop_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:rocio_app/domain/crop/history.dart';

class CropStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<Crop> _crops = [];
  AppointmentDataSource source = AppointmentDataSource([]);

  Crop selectedCrops = Crop(
      name: 'a', cropType: 'a', soilType: 'a', growthStage: 'a', fieldId: -1);

  List<Crop> get crops => [..._crops];
  bool get noCrops => _crops.isEmpty;

  void updateSelected({int cropId = -1}) {
    if (_crops.isNotEmpty && cropId == -1) {
      selectedCrops = _crops[0];
    } else if (_crops.isNotEmpty && cropId != -1) {
      selectedCrops = _crops.firstWhere((crop) => crop.id == cropId);
    }
    notifyListeners();
  }

  Future<void> getCrops(int fieldId) async {
    CropService cropService = CropService();
    List<Crop> crops = await cropService.getCrops(fieldId);
    _crops = crops;
    updateSelected();
    notifyListeners();
  }

  Future<Crop> createCrop(Crop crop) async {
    CropService cropService = CropService();
    Crop newCrop = await cropService.createCrop(crop);
    _crops.add(newCrop);
    notifyListeners();
    return newCrop;
  }

  Future<void> getCropHistory(int month, int year) async {
    CropService cropService = CropService();
    List<History> history =
        await cropService.getHistory(selectedCrops.id, month, year);
    final appointments = history.map((history) {
      return Appointment(
          startTime: history.startDate,
          endTime: history.endDate,
          subject: 'Duracion: ${history.duration.toInt()} minutos');
    }).toList();

    source = AppointmentDataSource(appointments);
    notifyListeners();
  }

  Future<void> stopIrrigation() async {
    CropService cropService = CropService();
    await cropService.stopIrrigation(selectedCrops.id);
    selectedCrops.isIrrigating = false;
    notifyListeners();
  }

  Future<void> startIrrigation() async {
    CropService cropService = CropService();
    await cropService.startIrrigation(selectedCrops.id);
    selectedCrops.isIrrigating = true;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('crops', crops));
    properties.add(EnumProperty('selectedCrop', selectedCrops));
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
