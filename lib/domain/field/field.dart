class Field {
  int id;
  String name;
  String address;
  int fieldSize;
  int humidity;
  int temperature;
  Field(
      {required this.id,
      required this.address,
      required this.name,
      required this.fieldSize,
      required this.humidity,
      required this.temperature});
}
