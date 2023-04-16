import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/field/field.dart';

class FieldStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<Field> _fields = [];

  Field selectedField = Field(address: 'Direccion', name: 'Nombre', fieldSize: 0);

  List<Field> get fields => [..._fields];
  bool get noFields => _fields.isEmpty;

  void updateSelected() {
    if(_fields.isNotEmpty) {
      selectedField = fields[0];
    }
  }
  void getFields(int userId) {
    // call api
    _fields = [];
    updateSelected();
    notifyListeners();
  }

  bool createField(Field field){
    field.id = fields.length;
    _fields.add(field);
    notifyListeners();
    return true;

  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('user', fields));
  }
}
