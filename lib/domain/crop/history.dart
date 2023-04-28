import 'dart:convert';

class History {
  final DateTime startDate;
  final DateTime endDate;
  final double duration;

  History({
    required this.startDate,
    required this.endDate,
    required this.duration,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      duration: json['duration'].toDouble(),
    );
  }

  static List<History> listFromJson(String json) {
    List<History> histories = [];
    for (var history in jsonDecode(json)) {
      histories.add(History.fromJson(history));
    }
    return histories;
  }
}
