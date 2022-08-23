import 'package:admin_pnal/Helper/server_gate.dart';
import 'package:admin_pnal/screens/news/bloc/addNewsModel.dart';
import 'package:admin_pnal/screens/news/bloc/events.dart';
import 'package:admin_pnal/screens/news/bloc/model.dart';
import 'package:admin_pnal/screens/news/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
        print(_model.data[0].image);
        yield ShowNewsStateSuccess(data: _model.data);
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
  CustomerData collectData = CustomerData(
    title: TextEditingController(),
    description: TextEditingController(),
    image: null,
  );

  @override
  Stream<AddNewsStates> mapEventToState(AddNewsEvents event) async* {
    if (event is AddNewsEventStart) {
      yield AddStateStart();
      CustomResponse response = await addNews(
        // collectData: event.collectData,
        title: event.title.toString(),
        description: event.description.toString(),
      );
      if (response.success!) {
        yield AddStateSuccess();
      } else {
        if (response.errType == 0) {
          yield AddStateFailed(
            errType: 0,
            msg: "Network error ",
          );
        } else if (response.errType == 1) {
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
    // required CustomerData collectData,
    required String title,
    required String description,
  }) async {
    serverGate.addInterceptors();

    print("***************$collectData********************");
    CustomResponse response = await serverGate.sendToServer(url: 'new/add', headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
        // body: collectData.toJson(),
        body: {
          "title": title,
          "description": description,
          "image": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_NVsTCFrgu9QcFML119RrCIvXw2_9keJNuw&usqp=CAU',
        });
    return response;
  }
}
