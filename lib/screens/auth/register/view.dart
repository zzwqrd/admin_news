import 'package:admin_pnal/Helper/Btns.dart';
import 'package:admin_pnal/Helper/fluttertoast%20copy.dart';
import 'package:admin_pnal/Helper/text_form.dart';
import 'package:admin_pnal/screens/auth/login/view.dart';
import 'package:admin_pnal/screens/auth/register/bloc/bloc.dart';
import 'package:admin_pnal/screens/auth/register/bloc/events.dart';
import 'package:admin_pnal/screens/auth/register/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc bloc = KiwiContainer().resolve<RegisterBloc>();

  void dispose() {
    bloc.close();
    super.dispose();
  }

  void initState() {
    bloc.collectData.name = TextEditingController();
    bloc.collectData.email = TextEditingController();
    bloc.collectData.password = TextEditingController();
    bloc.collectData.confirmationPassword = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: bloc.formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 30.h, 0.w, 30.h),
                  child: const Text(
                    'LOGO',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                txtField(
                  controller: bloc.name,
                  context: context,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (o) {},
                  hintText: 'Name',
                  prefix: 'assets/icons/prefix-Phone.png',
                  enabled: true,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                txtField(
                  controller: bloc.email,
                  context: context,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (o) {},
                  hintText: 'Email',
                  prefix: 'assets/icons/prefix-Phone.png',
                  enabled: true,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                txtField(
                  controller: bloc.password,
                  context: context,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (o) {},
                  hintText: 'password',
                  prefix: 'assets/icons/prefix-Phone.png',
                  enabled: true,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                txtField(
                  controller: bloc.confirmationPassword,
                  context: context,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "password_confirmation";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (o) {},
                  hintText: 'password_confirmation',
                  prefix: 'assets/icons/prefix-Phone.png',
                  enabled: true,
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is RegisterStateSuccess) {
                      showMassege(
                        text: state.model.message,
                        state: ToastStates.SUCCESS,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    } else if (state is RegisterStateFailde) {
                      showMassege(
                        text: state.msg,
                        state: ToastStates.SUCCESS,
                      );
                    }
                  },
                  builder: (context, state) {
                    return btn(
                      context: context,
                      txt: "تسجيل الدخول",
                      onTap: () {
                        setState(() {
                          if (!bloc.formKey.currentState!.validate()) {
                            return;
                          } else {
                            bloc.formKey.currentState!.save();
                            bloc.add(
                              RegisterEventsStart(
                                name: bloc.name.text,
                                email: bloc.email.text,
                                password: bloc.password.text,
                                confirmationPassword: bloc.confirmationPassword.text,
                              ),
                            );
                          }
                        });
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerData {
  TextEditingController name;
  TextEditingController email;
  TextEditingController password;
  TextEditingController confirmationPassword;

  var msgToken;
  CustomerData({
    required this.name,
    required this.email,
    required this.password,
    this.msgToken,
    required this.confirmationPassword,
  });

  Map<String, dynamic> toJson() => {
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "password_confirmation": confirmationPassword.text,
        "access_token": msgToken,
        // "device_type": Platform.isIOS ? "ios" : "android",
      };
}
