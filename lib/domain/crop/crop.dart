import 'dart:convert';

class Crop {
  int id;
  String name;
  String cropType;
  String soilType;
  String growthStage;
  int fieldId;
  int irrigationFrequency;
  bool isIrrigating;
  Crop(
      {this.id = 0,
      required this.name,
      required this.cropType,
      required this.soilType,
      required this.growthStage,
      required this.fieldId,
      this.isIrrigating = false,
      this.irrigationFrequency = -1});

  static List<Crop> listFromJson(String json) {
    List<Crop> fields = [];
    for (var field in jsonDecode(json)) {
      fields.add(Crop.fromMap(field));
    }
    return fields;
  }

  factory Crop.fromJson(String str) => Crop.fromMap(json.decode(str));
  static List<Crop> listFromJsonPartial(String json) {
    List<Crop> fields = [];
    for (var field in jsonDecode(json)) {
      fields.add(Crop.fromMapPartial(field));
    }
    return fields;
  }

  factory Crop.fromJsonPartial(String str) =>
      Crop.fromMapPartial(json.decode(str));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'crop_type': cropType,
      'soil_type': soilType,
      'growth_stage': growthStage,
      'field_id': fieldId,
      'irrigation_frequency': irrigationFrequency,
    };
  }

  factory Crop.fromMapPartial(Map<String, dynamic> map) {
    return Crop(
      id: map['id'],
      name: map['name'],
      cropType: map['crop_type'],
      soilType: map['soil_type'],
      growthStage: map['growth_stage'],
      fieldId: map['field_id'],
    );
  }

  Map<String, dynamic> toPartialMap() {
    return {
      'name': name,
      'crop_type': cropType,
      'soil_type': soilType,
      'growth_stage': growthStage,
      'field_id': fieldId,
    };
  }

  factory Crop.fromMap(Map<String, dynamic> map) {
    return Crop(
        id: map['id'],
        name: map['name'],
        cropType: map['crop_type'],
        soilType: map['soil_type'],
        growthStage: map['growth_stage'],
        fieldId: map['field_id'],
        irrigationFrequency: map['irrigation_frequency'],
        isIrrigating: map['is_irrigating'] ?? false);
  }
}
