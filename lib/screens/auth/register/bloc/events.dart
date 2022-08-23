import 'package:admin_pnal/screens/auth/register/view.dart';

class RegisterEvents {}

class RegisterEventsStart extends RegisterEvents {
  String name;
  String email;
  String password;
  String confirmationPassword;
  RegisterEventsStart({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
  });
}
