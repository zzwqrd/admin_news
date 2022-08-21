import 'package:admin_pnal/Helper/server_gate.dart';
import 'package:admin_pnal/screens/news/bloc/addNewsModel.dart';
import 'package:admin_pnal/screens/news/bloc/events.dart';
import 'package:admin_pnal/screens/news/bloc/model.dart';
import 'package:admin_pnal/screens/news/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ShowNewsBloc extends Bloc<ShowNewsEvents, ShowNewsStates> {
  ShowNewsBloc() : super(ShowNewsStateStart());

  ServerGate serverGate = ServerGate();

  @override
  Stream<ShowNewsStates> mapEventToState(ShowNewsEvents event) async* {
    if (event is ShowNewsEventStart) {
      yield ShowNewsStateStart();
      CustomResponse response = await fetchData();

      if (response.success!) {
        ShowNewsModel _model = ShowNewsModel.fromJson(response.response!.data);
        print(_model.posts[0].image);
        yield ShowNewsStateSuccess(data: _model.posts);
      } else {
        print("from map event to state show error => ");
        print(response.error.toString());

        if (response.errType == 0) {
          yield ShowNewsStateFailed(
            errType: 0,
            msg: "Network error ",
          );
        } else if (response.errType == 1) {
          yield ShowNewsStateFailed(
            errType: response.statusCode,
            msg: response.msg,
          );
        } else {
          yield ShowNewsStateFailed(
            errType: response.statusCode,
            msg: "Server error , please try again",
          );
        }
      }
    }
  }

  Future<CustomResponse> fetchData() async {
    serverGate.addInterceptors();

    CustomResponse response = await serverGate.getFromServer(
      url: 'new/show',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    return response;
  }
}

class DeleteNewsBloc extends Bloc<DeleteNewsEvents, DeleteNewsStates> {
  DeleteNewsBloc() : super(DeleteNewsStates());

  ServerGate serverGate = ServerGate();

  @override
  Stream<DeleteNewsStates> mapEventToState(DeleteNewsEvents event) async* {
    if (event is DeleteNewsEventStart) {
      yield DeleteStateStart(id: event.id);
      CustomResponse response = await deleteNews(
        url: event.url,
      );
      if (response.success!) {
        yield DeleteStateSuccess();
      } else {
        if (response.errType == 0) {
          yield DeleteStateFailed(
            errType: 0,
            msg: "Network error ",
          );
        } else if (response.errType == 1) {
          // print("from xxxxx => ${response.error['message']}");
          yield DeleteStateFailed(
            errType: 1,
            msg: response.msg,
          );
        } else {
          yield DeleteStateFailed(
            errType: 2,
            msg: "Server error , please try again",
          );
        }
      }
    }
  }

  Future<CustomResponse> deleteNews({
    required String url,
  }) async {
    serverGate.addInterceptors();
    print("***************$url********************");
    CustomResponse response = await serverGate.deleteFromServer(
      url: url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    return response;
  }
}

//   add News

class AddNewsBloc extends Bloc<AddNewsEvents, AddNewsStates> {
  AddNewsBloc() : super(AddNewsStates());

  ServerGate serverGate = ServerGate();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  dynamic imageController;

  @override
  Stream<AddNewsStates> mapEventToState(AddNewsEvents event) async* {
    if (event is AddNewsEventStart) {
      yield AddStateStart();
      CustomResponse response = await addNews(
        title: event.title,
        description: event.description,
        // image: event.image,
      );
      if (response.success!) {
        AddNewsModel model = AddNewsModel.fromJson(response.response!.data);
        yield AddStateSuccess(model: model);
      } else {
        if (response.errType == 0) {
          yield AddStateFailed(
            errType: 0,
            msg: "Network error ",
          );
        } else if (response.errType == 1) {
          // print("from xxxxx => ${response.error['message']}");
          yield AddStateFailed(
            errType: 1,
            msg: response.msg,
          );
        } else {
          yield AddStateFailed(
            errType: 2,
            msg: "Server error , please try again",
          );
        }
      }
    }
  }

  Future<CustomResponse> addNews({
    String? title,
    String? description,
    // dynamic? image,
  }) async {
    serverGate.addInterceptors();
    print("***************$title********************");
    print("***************$description********************");
    // print("***************$image********************");
    CustomResponse response = await serverGate.sendToServer(
      url: 'new/add',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: {
        "title": title,
        "description": description,
        "image": 'http://127.0.0.1:8000/1660936512.png',
      },
    );
    return response;
  }
}
