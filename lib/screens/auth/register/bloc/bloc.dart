import 'package:admin_pnal/Helper/server_gate.dart';
import 'package:admin_pnal/screens/auth/register/bloc/events.dart';
import 'package:admin_pnal/screens/auth/register/bloc/model.dart';
import 'package:admin_pnal/screens/auth/register/bloc/states.dart';
import 'package:admin_pnal/screens/auth/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  RegisterBloc() : super(RegisterState());
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final confirmationPassword = TextEditingController();

  CustomerData collectData = CustomerData(
    email: TextEditingController(),
    name: TextEditingController(),
    password: TextEditingController(),
    confirmationPassword: TextEditingController(),
  );

  ServerGate serverGate = ServerGate();

  Stream<RegisterState> mapEventToState(RegisterEvents event) async* {
    if (event is RegisterEventsStart) {
      yield RegisterStateStart();
      CustomResponse response =
          await RegisterData(name: event.name, email: event.email, password: event.password, confirmationPassword: event.confirmationPassword);
      if (response.success!) {
        RegisterModel model = RegisterModel.fromJson(response.response!.data);
        print("kefkihewi0");
        yield RegisterStateSuccess(model: model);
      } else {
        yield RegisterStateFailde(
          errorType: response.errType!,
          msg: response.msg!,
        );
      }
    }
  }

  Future<CustomResponse> RegisterData({
    required String name,
    required String email,
    required String password,
    required String confirmationPassword,
  }) async {
    serverGate.addInterceptors();
    // Map<String, dynamic> headers = await headersMapWithoutToken();
    CustomResponse response = await serverGate.sendToServer(
      url: 'auth/register',
      body: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmationPassword,
      },
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    return response;
  }
}
