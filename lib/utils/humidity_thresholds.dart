class _Humidity {
  final int min;
  final int max;

  _Humidity({required this.min, required this.max});
}

final Map<int, _Humidity> humidityThresholds = {
  1: _Humidity(min: 15, max: 35),
  2: _Humidity(min: 45, max: 55),
  3: _Humidity(min: 50, max: 65),
};
