import 'dart:convert';

class User {
  int id;
  String name;
  String username;

  User({
    required this.id,
    required this.name,
    required this.username,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
      };
}
