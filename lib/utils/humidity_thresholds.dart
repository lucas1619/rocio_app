class Humidity {
  final int min;
  final int max;

  Humidity({required this.min, required this.max});
}

final Map<int, Humidity> humidityThresholds = {
  1: Humidity(min: 46, max: 71),
  2: Humidity(min: 36, max: 57),
  3: Humidity(min: 31, max: 51),
  4: Humidity(min: 39, max: 65),
  5: Humidity(min: 35, max: 50),
  6: Humidity(min: 30, max: 46),
};
