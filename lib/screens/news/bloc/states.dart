import 'package:admin_pnal/screens/news/bloc/addNewsModel.dart';
import 'package:admin_pnal/screens/news/bloc/model.dart';

class ShowNewsStates {}

class ShowNewsStateStart extends ShowNewsStates {}

class ShowNewsStateSuccess extends ShowNewsStates {
  List<Post>? data = [];
  ShowNewsStateSuccess({required this.data});
}

class ShowNewsStateFailed extends ShowNewsStates {
  String? msg;
  int? errType;
  ShowNewsStateFailed({this.msg, this.errType});
}

class DeleteItemState extends ShowNewsStates {}

//////////////
/// delete ///
/////////////
///
class DeleteNewsStates {}

class DeleteStateStart extends DeleteNewsStates {
  int id;
  DeleteStateStart({
    required this.id,
  });
}

class DeleteStateSuccess extends DeleteNewsStates {}

class DeleteStateFailed extends DeleteNewsStates {
  String? msg;
  int? errType;
  DeleteStateFailed({this.msg, this.errType});
}

//////////////
/// add ///
/////////////

class AddNewsStates {}

class AddStateStart extends AddNewsStates {}

class AddStateSuccess extends AddNewsStates {
  AddNewsModel model;
  AddStateSuccess({
    required this.model,
  });
}

class AddStateFailed extends AddNewsStates {
  String? msg;
  int? errType;
  AddStateFailed({this.msg, this.errType});
}
