import 'dart:convert';

class Device {
  final int id;
  final String name;
  final int deviceType;
  int cropId;

  Device({
    required this.id,
    required this.name,
    required this.deviceType,
    this.cropId = -1,
  });

  static List<Device> listFromJson(String json) {
    final List<dynamic> list = jsonDecode(json);
    return list.map((e) => Device.fromJson(e)).toList();
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      deviceType: json['device_type'],
      cropId: json['crop_id'] ?? -1,
    );
  }

  Map<String, dynamic> toPartialMap() {
    return {
      'id': id,
      'name': name,
      'device_type': deviceType,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'device_type': deviceType,
      'crop_id': cropId,
    };
  }
}
