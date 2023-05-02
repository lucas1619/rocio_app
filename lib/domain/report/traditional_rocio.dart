class TraditionalRocio {
  final int irrigation;
  final int traditional;

  TraditionalRocio({
    required this.irrigation,
    required this.traditional,
  });

  factory TraditionalRocio.fromJson(Map<String, dynamic> json) {
    return TraditionalRocio(
      irrigation: json['irrigation'].toInt(),
      traditional: json['traditional'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'irrigation': irrigation,
      'traditional': traditional,
    };
  }

  static List<TraditionalRocio> listFromJson(List<dynamic> jsonList) {
    List<TraditionalRocio> items = [];
    for (var item in jsonList) {
      final traditionalRocio = TraditionalRocio.fromJson(item);
      items.add(traditionalRocio);
    }
    return items;
  }
}
