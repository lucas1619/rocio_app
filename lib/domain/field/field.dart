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
}
