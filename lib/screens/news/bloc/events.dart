import 'package:admin_pnal/screens/news/bloc/addNewsModel.dart';
import 'package:flutter/cupertino.dart';

class ShowNewsEvents {}

class ShowNewsEventStart extends ShowNewsEvents {}

//////////////
/// delete ///
/////////////
class DeleteNewsEvents {}

class DeleteNewsEventStart extends DeleteNewsEvents {
  String url;
  int id;
  DeleteNewsEventStart({
    required this.url,
    required this.id,
  });
}

//////////////
/// add ///
/////////////
class AddNewsEvents {}

class AddNewsEventStart extends AddNewsEvents {
  // CustomerData collectData;
  String title;
  String description;
  dynamic image;
  AddNewsEventStart({
    required this.title,
    required this.description,
    required this.image,
  });
}
