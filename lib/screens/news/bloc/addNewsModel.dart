import 'package:flutter/material.dart';

class CustomerData {
  TextEditingController title;
  TextEditingController description;
  dynamic image;

  CustomerData({
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": 'no imge',
      };
}
