import 'package:admin_pnal/screens/auth/register/bloc/model.dart';

class RegisterState {}

class RegisterStateStart extends RegisterState {}

class RegisterStateSuccess extends RegisterState {
  RegisterModel model;
  RegisterStateSuccess({
    required this.model,
  });
}

class RegisterStateFailde extends RegisterState {
  int errorType;
  String msg;
  RegisterStateFailde({
    required this.errorType,
    required this.msg,
  });
}
