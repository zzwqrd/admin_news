import 'package:admin_pnal/Helper/cache_helper.dart';
import 'package:admin_pnal/Helper/server_gate.dart';
import 'package:admin_pnal/screens/auth/login/bloc/events.dart';
import 'package:admin_pnal/screens/auth/login/bloc/model.dart';
import 'package:admin_pnal/screens/auth/login/bloc/states.dart';
import 'package:admin_pnal/screens/auth/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState());
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  CustomerData collectData = CustomerData(
    email: TextEditingController(),
    name: TextEditingController(),
    password: TextEditingController(),
    confirmationPassword: TextEditingController(),
  );

  ServerGate serverGate = ServerGate();

  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginEventsStart) {
      yield LoginStateStart();
      CustomResponse response = await LoginData(
        email: event.email,
        password: event.password,
      );
      if (response.success!) {
        LoginModel model = LoginModel.fromJson(response.response!.data);
        print(response.response!.data);
        CacheHelper.setUserId(model.user.id);
        CacheHelper.setFullName(model.user.name);
        CacheHelper.setEmail(model.user.email);

        CacheHelper.setUserType(model.tokenType);
        CacheHelper.setFCMToken(model.accessToken);

        yield LoginStateSuccess(model: model);
      } else {
        yield LoginStateFailde(
          errorType: response.errType!,
          msg: response.msg!,
        );
      }
    }
  }

  Future<CustomResponse> LoginData({
    required String email,
    required String password,
  }) async {
    serverGate.addInterceptors();
    // Map<String, dynamic> headers = await headersMapWithoutToken();
    CustomResponse response = await serverGate.sendToServer(
      url: 'auth/login',
      body: {
        "email": email,
        "password": password,
      },
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    return response;
  }
}
