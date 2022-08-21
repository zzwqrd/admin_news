import 'package:admin_pnal/screens/auth/Login/view.dart';

class LoginEvents {}

class LoginEventsStart extends LoginEvents {
  String email;
  String password;

  LoginEventsStart({
    required this.email,
    required this.password,
  });
}
