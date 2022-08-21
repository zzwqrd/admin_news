import 'dart:convert';

AddNewsModel addNewsModelFromJson(String str) => AddNewsModel.fromJson(json.decode(str));

class AddNewsModel {
  AddNewsModel({
    required this.status,
    required this.message,
    required this.posts,
  });

  bool status;
  String message;
  Posts posts;

  factory AddNewsModel.fromJson(Map<String, dynamic> json) => AddNewsModel(
        status: json["status"],
        message: json["message"],
        posts: Posts.fromJson(json["posts"]),
      );
}

class Posts {
  Posts({
    required this.title,
    required this.dascription,
    required this.image,
    required this.id,
  });

  String title;
  String dascription;
  dynamic image;
  int id;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        title: json["title"],
        dascription: json["dascription"],
        image: json["image"],
        id: json["id"],
      );
}
