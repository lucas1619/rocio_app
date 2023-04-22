import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/field/field.dart';
import 'package:rocio_app/services/field_service.dart';

class FieldStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<Field> _fields = [];

  Field selectedField =
      Field(address: 'Direccion', name: 'Nombre', fieldSize: 0);

  List<Field> get fields => [..._fields];
  bool get noFields => _fields.isEmpty;

  void updateSelected({int fieldId = -1}) {
    if (_fields.isNotEmpty && fieldId == -1) {
      selectedField = _fields[0];
    } else if (_fields.isNotEmpty && fieldId != -1) {
      selectedField = _fields.firstWhere((field) => field.id == fieldId);
    }
    notifyListeners();
  }

  Future<void> getFields(int userId) async {
    FieldService fieldService = FieldService();
    List<Field> fields = await fieldService.getFields(userId);
    _fields = fields;
    updateSelected();
    notifyListeners();
  }

  bool createField(Field field) {
    field.id = _fields.length + 1;
    _fields.add(field);
    notifyListeners();
    return true;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('fields', fields));
    properties.add(EnumProperty('selectedField', selectedField));
  }
}
