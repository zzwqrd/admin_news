import 'package:admin_pnal/screens/auth/login/bloc/model.dart';

class LoginState {}

class LoginStateStart extends LoginState {}

class LoginStateSuccess extends LoginState {
  LoginModel model;
  LoginStateSuccess({
    required this.model,
  });
}

class LoginStateFailde extends LoginState {
  int errorType;
  String msg;
  LoginStateFailde({
    required this.errorType,
    required this.msg,
  });
}
