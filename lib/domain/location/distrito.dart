import 'dart:convert';

class Distrito {
  final String name;
  final String ubigeo;
  Distrito({required this.name, required this.ubigeo});

  static List<Distrito> listFromJson(String json) {
    final List<dynamic> parsedJson = jsonDecode(json);
    return parsedJson.map((dynamic json) => Distrito.fromJson(json)).toList();
  }

  factory Distrito.fromJson(Map<String, dynamic> json) {
    return Distrito(
      name: json['distrito'] as String,
      ubigeo: json['ubigeo'] as String,
    );
  }
}
