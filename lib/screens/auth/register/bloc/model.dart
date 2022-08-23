import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  RegisterModel({
    required this.message,
    required this.user,
  });

  String message;
  User user;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    required this.name,
    required this.email,
    required this.id,
  });

  String name;
  String email;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        id: json["id"],
      );
}
