// To parse this JSON data, do
//
//     final showNewsModel = showNewsModelFromJson(jsonString);

import 'dart:convert';

ShowNewsModel showNewsModelFromJson(String str) => ShowNewsModel.fromJson(json.decode(str));

class ShowNewsModel {
  ShowNewsModel({
    required this.status,
    required this.posts,
  });

  bool status;
  List<Post> posts;

  factory ShowNewsModel.fromJson(Map<String, dynamic> json) => ShowNewsModel(
        status: json["status"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
}

class Post {
  Post({
    required this.id,
    required this.title,
    required this.image,
    required this.dascription,
  });

  int id;
  String title;
  String image;
  String dascription;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        dascription: json["dascription"],
      );
}
