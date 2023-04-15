import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/field/field.dart';

class FieldStore with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Field> _fields = [];

  List<Field> get fields => [..._fields];
  bool get noFields => _fields.isEmpty;

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('user', fields));
  }
}
