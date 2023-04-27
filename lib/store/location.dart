import 'package:flutter/foundation.dart';
import 'package:rocio_app/domain/location/distrito.dart';
import 'package:rocio_app/services/location_service.dart';

class LocationStore with ChangeNotifier, DiagnosticableTreeMixin {
  List<String> _departamentos = [];
  List<String> get departamentos => _departamentos;
  List<String> _provincias = [];
  List<String> get provincias => _provincias;
  List<Distrito> _distritos = [];
  List<Distrito> get distritos => _distritos;

  final LocationService _locationService = LocationService();

  Future<void> getDepartamentos() async {
    _departamentos = await _locationService.getDepartamentos();
    notifyListeners();
  }

  Future<void> getProvincias(String departamento) async {
    _provincias = await _locationService.getProvincias(departamento);
    notifyListeners();
  }

  Future<void> getDistritos(String departamento, String provincia) async {
    _distritos = await _locationService.getDistritos(departamento, provincia);
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('departamentos', departamentos));
    properties.add(IterableProperty<String>('provincias', provincias));
    properties.add(IterableProperty<Distrito>('distritos', distritos));
  }
}
