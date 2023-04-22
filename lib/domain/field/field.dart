import 'dart:convert';

class Field {
  int id;
  String name;
  final String address;
  int fieldSize;
  int humidity;
  int temperature;
  Field(
      {this.id = 0,
      required this.address,
      required this.name,
      required this.fieldSize,
      this.humidity = 0,
      this.temperature = 0});

  factory Field.fromJson(String str) => Field.fromMap(json.decode(str));

  static List<Field> listFromJson(String json) {
    List<Field> fields = [];
    for (var field in jsonDecode(json)) {
      fields.add(Field.fromJson(field));
    }
    return fields;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'name': name,
      'fieldSize': fieldSize,
      'humidity': humidity,
      'temperature': temperature,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'name': name,
      'fieldSize': fieldSize,
      'humidity': humidity,
      'temperature': temperature,
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      id: map['id'],
      address: map['address'],
      name: map['name'],
      fieldSize: map['fieldSize'],
      humidity: map['humidity'],
      temperature: map['temperature'],
    );
  }
}
