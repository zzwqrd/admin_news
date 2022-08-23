// To parse this JSON data, do
//
//     final showNewsModel = showNewsModelFromJson(jsonString);

import 'dart:convert';

ShowNewsModel showNewsModelFromJson(String str) => ShowNewsModel.fromJson(json.decode(str));

String showNewsModelToJson(ShowNewsModel data) => json.encode(data.toJson());

class ShowNewsModel {
  ShowNewsModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory ShowNewsModel.fromJson(Map<String, dynamic> json) => ShowNewsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });

  int id;
  String title;
  String image;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
      };
}
