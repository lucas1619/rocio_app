class Humidity {
  final int min;
  final int max;

  Humidity({required this.min, required this.max});
}

final Map<int, Humidity> humidityThresholds = {
  1: Humidity(min: 15, max: 35),
  2: Humidity(min: 45, max: 55),
  3: Humidity(min: 50, max: 65),
};
