import 'dart:convert';

class Field {
  int id;
  String name;
  final String locationId;
  int area;
  int humidity;
  int temperature;
  Field(
      {this.id = 0,
      required this.locationId,
      required this.name,
      required this.area,
      this.humidity = 0,
      this.temperature = 0});

  factory Field.fromJson(String str) => Field.fromMap(json.decode(str));
  static List<Field> listFromJsonPartial(String json) {
    List<Field> fields = [];
    for (var field in jsonDecode(json)) {
      fields.add(Field.fromMapPartial(field));
    }
    return fields;
  }

  factory Field.fromJsonPartial(String str) =>
      Field.fromMapPartial(json.decode(str));

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location_id': locationId,
      'name': name,
      'area': area,
      'humidity': humidity,
      'temperature': temperature,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'location_id': locationId,
      'name': name,
      'area': area,
      'humidity': humidity,
      'temperature': temperature,
    };
  }

  factory Field.fromMapPartial(Map<String, dynamic> map) {
    return Field(
      id: map['id'],
      locationId: map['location_id'],
      name: map['name'],
      area: double.parse(map['area']).toInt(),
    );
  }

  Map<String, dynamic> toPartialMap() {
    print(locationId);
    return {
      'location_id': locationId,
      'name': name,
      'area': area,
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      id: map['id'],
      locationId: map['location_id'],
      name: map['name'],
      area: double.parse(map['area']).toInt(),
      humidity: map['humidity'],
      temperature: map['temperature'],
    );
  }
}
