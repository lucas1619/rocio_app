import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/crop/crop.dart';
import 'package:rocio_app/domain/field/field.dart';
import 'package:rocio_app/services/field_service.dart';
import 'package:rocio_app/services/crop_service.dart';

class DevicesStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<Field> _fields = [];
  List<Crop> _crops = [];

  List<Field> get fields => [..._fields];
  List<Crop> get crops => [..._crops];

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

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('fields', fields));
    properties.add(IterableProperty('crops', crops));
  }
}
